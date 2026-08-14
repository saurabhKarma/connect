import 'package:connect/module/broadcastlist/application/broadcast_list_providers.dart';
import 'package:connect/module/broadcastlist/data/broadcast_list_models.dart';
import 'package:connect/module/contact/data/contact_ui.dart';
import 'package:connect/module/contact/presentation/contacts_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/utility/phone_util.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Manage a broadcast list's recipients: view, add (from contacts), and remove members.
class ManageRecipientsScreen extends ConsumerStatefulWidget {
  final String listId;
  final String name;

  const ManageRecipientsScreen({super.key, required this.listId, required this.name});

  @override
  ConsumerState<ManageRecipientsScreen> createState() => _ManageRecipientsScreenState();
}

class _ManageRecipientsScreenState extends ConsumerState<ManageRecipientsScreen> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(broadcastListDetailProvider(widget.listId));
    return Scaffold(
      appBar: CommonAppBar(title: l10n.recipients, showBack: true),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: _busy ? null : _addMembers,
        icon: const Icon(Icons.person_add_alt_1, color: AppColors.onPrimary),
        label: Text(l10n.add, style: AppTextStyles.style14px.w700.copyWith(color: AppColors.onPrimary)),
      ),
      body: SafeArea(
        top: false,
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Text(l10n.couldNotLoadRecipients,
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          data: (detail) {
            if (detail.members.isEmpty) return _empty();
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 90.h),
              itemCount: detail.members.length + 1,
              separatorBuilder: (_, __) => SizedBox(height: 4.h),
              itemBuilder: (_, i) {
                if (i == 0) return _header(detail.members.length);
                return _memberTile(detail.members[i - 1]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _header(int count) => Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text(context.l10n.recipientsCount(count),
            style: AppTextStyles.style13px.w600.copyWith(color: AppColors.textSecondary)),
      );

  Widget _empty() => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.group_outlined, size: 84.sp, color: AppColors.border),
            SizedBox(height: 14.h),
            Text(context.l10n.noRecipientsYet,
                style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
            SizedBox(height: 6.h),
            Text(context.l10n.tapAddToInclude,
                style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      );

  Widget _memberTile(BroadcastListMemberUi m) {
    final title = (m.name != null && m.name!.isNotEmpty) ? m.name! : m.phone;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14.r)),
      child: Row(
        children: [
          UserAvatar(name: title, size: 42),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.style14px.w600),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(m.phone,
                        style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
                    if (!m.hasApp) ...[
                      SizedBox(width: 6.w),
                      Text('· ${context.l10n.notOnApp}',
                          style: AppTextStyles.style12px.w500.copyWith(color: AppColors.accent)),
                    ],
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.remove_circle_outline, color: AppColors.danger, size: 22.sp),
            onPressed: _busy ? null : () => _removeMember(m),
          ),
        ],
      ),
    );
  }

  Future<void> _addMembers() async {
    final contacts = await Navigator.of(context).push<List<ContactUi>>(
      MaterialPageRoute(builder: (_) => const ContactsScreen(asFlow: true, forBroadcast: true)),
    );
    if (contacts == null || contacts.isEmpty || !mounted) return;
    final phones = contacts.map((c) => PhoneUtil.toE164(c.phone)).toSet().toList();
    setState(() => _busy = true);
    try {
      await ref.read(broadcastListRepositoryProvider).addMembers(widget.listId, phones);
      ref.invalidate(broadcastListDetailProvider(widget.listId));
      ref.invalidate(broadcastListsProvider);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotAddRecipients);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _removeMember(BroadcastListMemberUi m) async {
    final l10n = context.l10n;
    final title = (m.name != null && m.name!.isNotEmpty) ? m.name! : m.phone;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(l10n.removeRecipient, style: AppTextStyles.style16px.w700),
        content: Text(l10n.removeRecipientConfirm(title),
            style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.remove, style: AppTextStyles.style14px.w700.copyWith(color: AppColors.danger)),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _busy = true);
    try {
      await ref.read(broadcastListRepositoryProvider).removeMember(widget.listId, m.phone);
      ref.invalidate(broadcastListDetailProvider(widget.listId));
      ref.invalidate(broadcastListsProvider);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, l10n.couldNotRemoveRecipient);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}
