import 'package:connect/module/broadcastlist/application/broadcast_list_providers.dart';
import 'package:connect/module/broadcastlist/data/broadcast_list_models.dart';
import 'package:connect/module/broadcastlist/presentation/broadcast_list_thread_screen.dart';
import 'package:connect/module/contact/data/contact_ui.dart';
import 'package:connect/module/contact/presentation/contacts_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/utility/phone_util.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// The Broadcast tab: the user's saved broadcast lists. FAB → pick contacts → name → open thread.
class BroadcastListsScreen extends ConsumerStatefulWidget {
  const BroadcastListsScreen({super.key});

  @override
  ConsumerState<BroadcastListsScreen> createState() => _BroadcastListsScreenState();
}

class _BroadcastListsScreenState extends ConsumerState<BroadcastListsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(broadcastListsProvider);
    return Scaffold(
      appBar: CommonAppBar(title: l10n.broadcast, showBack: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: _newList,
        child: const Icon(Icons.campaign_outlined, color: AppColors.onPrimary),
      ),
      body: SafeArea(
        top: false,
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Text(l10n.broadcastListsLoadError,
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          data: (lists) {
            if (lists.isEmpty) return _empty();
            return RefreshIndicator(
              onRefresh: () async => ref.invalidate(broadcastListsProvider),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                itemCount: lists.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (_, i) => _tile(lists[i]),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _empty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.campaign_outlined, size: 96.sp, color: AppColors.border),
          SizedBox(height: 16.h),
          Text(context.l10n.noBroadcastListsYet,
              style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
          SizedBox(height: 8.h),
          Text(context.l10n.tapPlusToCreate,
              style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _tile(BroadcastListSummary l) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => BroadcastListThreadScreen(listId: l.id, name: l.name),
      )),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14.r)),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.campaign, color: AppColors.primary, size: 22.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.style16px.w700),
                  SizedBox(height: 3.h),
                  Text(
                    l.lastMessagePreview ?? context.l10n.recipientsCount(l.memberCount),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            if (l.lastMessageAt != null)
              Text(DateFormat('h:mm a').format(l.lastMessageAt!.toLocal()),
                  style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }

  Future<void> _newList() async {
    final contacts = await Navigator.of(context).push<List<ContactUi>>(
      MaterialPageRoute(builder: (_) => const ContactsScreen(asFlow: true, forBroadcast: true)),
    );
    if (contacts == null || contacts.isEmpty || !mounted) return;
    final name = await _nameDialog(contacts.length);
    if (name == null || name.isEmpty || !mounted) return;

    final phones = contacts.map((c) => PhoneUtil.toE164(c.phone)).toSet().toList();
    try {
      final summary = await ref.read(broadcastListRepositoryProvider).create(name: name, phones: phones);
      ref.invalidate(broadcastListsProvider);
      if (!mounted) return;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => BroadcastListThreadScreen(listId: summary.id, name: summary.name),
      ));
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotCreateList);
    }
  }

  Future<String?> _nameDialog(int count) {
    final l10n = context.l10n;
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(l10n.nameThisList, style: AppTextStyles.style16px.w700),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 120,
          decoration: InputDecoration(hintText: l10n.listNameHintExample(count)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: Text(l10n.create, style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
