import 'package:connect/module/broadcast/presentation/widgets/start_broadcast_sheet.dart';
import 'package:connect/module/contact/application/contacts_controller.dart';
import 'package:connect/module/contact/data/contact_ui.dart';
import 'package:connect/module/contact/data/device_contacts_repository.dart';
import 'package:connect/module/contact/presentation/add_contact_screen.dart';
import 'package:connect/module/contact/presentation/widgets/contact_tile.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsScreen extends ConsumerStatefulWidget {
  final bool asFlow;

  const ContactsScreen({super.key, this.asFlow = false});

  @override
  ConsumerState<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends ConsumerState<ContactsScreen> {
  final Set<String> _selected = {};
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final contactsAsync = ref.watch(contactsControllerProvider);

    return Scaffold(
      appBar: CommonAppBar(title: l10n.selectContacts, showBack: widget.asFlow),
      floatingActionButton: _selected.isEmpty
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              onPressed: _startBroadcast,
              child: const Icon(Icons.arrow_forward, color: AppColors.onPrimary),
            ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 12.h),
              child: AppSearchField(
                hintText: l10n.searchByNameNumber,
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: _newContactButton(l10n),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: contactsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
                error: (e, _) => _permissionState(l10n, e),
                data: (contacts) => _list(_filter(contacts)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ContactUi> _filter(List<ContactUi> all) {
    if (_query.isEmpty) return all;
    final q = _query.toLowerCase();
    return all.where((c) => c.name.toLowerCase().contains(q) || c.phone.contains(_query)).toList();
  }

  Widget _list(List<ContactUi> contacts) {
    if (contacts.isEmpty) {
      return Center(
        child: Text('No contacts found',
            style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemCount: contacts.length,
      itemBuilder: (_, i) {
        final c = contacts[i];
        return SelectableContactTile(
          contact: c,
          selected: _selected.contains(c.id),
          onTap: () => setState(
              () => _selected.contains(c.id) ? _selected.remove(c.id) : _selected.add(c.id)),
        );
      },
    );
  }

  Widget _permissionState(l10n, Object error) {
    final denied = error is ContactsPermissionException;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.contacts_outlined, size: 64.sp, color: AppColors.border),
            SizedBox(height: 16.h),
            Text(
              denied ? l10n.contactPermissionDesc : l10n.somethingWentWrong,
              textAlign: TextAlign.center,
              style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 220.w,
              child: AppButton(
                label: l10n.contactPermission,
                onPressed: () async {
                  await openAppSettings();
                  await ref.read(contactsControllerProvider.notifier).reload();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startBroadcast() async {
    final name = await StartBroadcastSheet.show(context);
    if (name == null || !mounted) return;
    // TODO: create the broadcast: tag selected phone contacts to the shop
    // (POST /shop/customers), then POST /broadcasts with the resulting members.
  }

  Widget _newContactButton(l10n) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const AddContactScreen()),
      ),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Icon(Icons.person_add_alt_1, color: AppColors.onPrimary, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(l10n.newContact,
                  style: AppTextStyles.style16px.w700.copyWith(color: AppColors.onPrimary)),
            ),
            Icon(Icons.arrow_forward, color: AppColors.onPrimary, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
