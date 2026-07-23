import 'package:connect/module/auth/application/auth_controller.dart';
import 'package:connect/module/auth/presentation/otp_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/app_images.dart';
import 'package:connect/res/local_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/error_message.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_text_field.dart';
import 'package:connect/widgets/language_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Step 1 of login: Mitra branding, phone entry, request OTP.
class PhoneScreen extends ConsumerStatefulWidget {
  /// Optional shop code (e.g. from a deep link / QR) to subscribe on login.
  final String? shopCode;

  const PhoneScreen({super.key, this.shopCode});

  @override
  ConsumerState<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends ConsumerState<PhoneScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _continue() async {
    final digits = _controller.text.trim();
    if (digits.length != 10) {
      ScaffoldToast.showErrorBottom(context, context.l10n.invalidMobile);
      return;
    }
    try {
      await ref
          .read(authControllerProvider.notifier)
          .requestOtp(phone: '+91$digits', shopCode: widget.shopCode);
      if (!mounted) return;
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OtpScreen()));
    } catch (e) {
      if (mounted) ScaffoldToast.showErrorBottom(context, friendlyError(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isLoading = ref.watch(authControllerProvider.select((s) => s.isLoading));

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        const Align(alignment: Alignment.centerRight, child: LanguageToggle()),
                        SizedBox(height: 36.h),
                        Image.asset(AppImages.mitraLogo, height: 300.h),
                        Text(l10n.tagline, style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
                        SizedBox(height: 48.h),
                        AppTextField(
                          controller: _controller,
                          hintText: l10n.enterNumberToLogin,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onSubmitted: (_) => _continue(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 16.w, right: 8.w, top: 13.w),
                            child: Text('+91 | ', style: AppTextStyles.style16px.w600.copyWith(color: grey200)),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        AppButton(
                          label: l10n.login,
                          icon: Icons.arrow_forward,
                          isLoading: isLoading,
                          onPressed: _continue,
                        ),
                        const Spacer(),
                        SizedBox(height: 24.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _feature(AppImages.icSecurity, l10n.secureCommunication),
                            _feature(AppImages.icBusiness, l10n.builtForBusiness),
                            _feature(AppImages.icProtected, l10n.yourDataProtected),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        _termsFooter(l10n),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _feature(String asset, String label) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(asset, height: 30.h),
          SizedBox(height: 8.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.style11px.w500.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _termsFooter(l10n) {
    final grey = AppTextStyles.style12px.w400.copyWith(color: AppColors.textSecondary);
    final link = AppTextStyles.style12px.w700.copyWith(color: AppColors.primary);
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: '${l10n.byContinuing} ', style: grey),
        TextSpan(text: l10n.termsOfService, style: link),
        TextSpan(text: ' ${l10n.and} ', style: grey),
        TextSpan(text: l10n.privacyPolicy, style: link),
      ]),
      textAlign: TextAlign.center,
    );
  }
}
