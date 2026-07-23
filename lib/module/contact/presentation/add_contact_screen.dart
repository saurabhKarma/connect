import 'package:connect/module/contact/application/contacts_controller.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/error_message.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Add a new contact (tagged to the shop). Name + phone.
class AddContactScreen extends ConsumerStatefulWidget {
  const AddContactScreen({super.key});

  @override
  ConsumerState<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends ConsumerState<AddContactScreen> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _add() async {
    if (_name.text.trim().isEmpty || _phone.text.trim().length != 10) {
      ScaffoldToast.showErrorBottom(context, context.l10n.invalidMobile);
      return;
    }
    setState(() => _saving = true);
    try {
      // Save to the phone's address book (so it appears in device contacts).
      await ref.read(deviceContactsRepositoryProvider).saveContact(
            name: _name.text.trim(),
            phone: '+91${_phone.text.trim()}',
          );
      // TODO: also tag to the shop via POST /shop/customers.
      ref.invalidate(contactsControllerProvider); // refresh the list
      if (!mounted) return;
      Navigator.of(context).maybePop();
    } catch (e) {
      if (mounted) ScaffoldToast.showErrorBottom(context, friendlyError(e));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CommonAppBar(title: l10n.addNewContact),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _label(l10n.nameLabel),
                    SizedBox(height: 8.h),
                    AppTextField(controller: _name, hintText: l10n.fullName),
                    SizedBox(height: 20.h),
                    _label(l10n.phoneNumberLabel),
                    SizedBox(height: 8.h),
                    AppTextField(
                      controller: _phone,
                      hintText: l10n.phoneNumberHint,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: AppButton(
                label: l10n.add,
                icon: Icons.arrow_forward,
                isLoading: _saving,
                onPressed: _add,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: text, style: AppTextStyles.style14px.w700),
      TextSpan(text: ' *', style: AppTextStyles.style14px.w700.copyWith(color: AppColors.danger)),
    ]));
  }
}
