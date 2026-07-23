import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shared text field (ported from the interiorspace design system).
/// Filled white input with a rounded outline, optional label/prefix/suffix.
class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    required this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(color: AppColors.inputBorder),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      cursorColor: AppColors.primary,
      style: AppTextStyles.style16px.w500,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        errorText: errorText,
        counterText: '',
        filled: true,
        fillColor: enabled ? AppColors.card : AppColors.disabled,
        hintStyle: AppTextStyles.style14px.w400.copyWith(color: AppColors.textHint),
        labelStyle: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: focusedBorder,
        focusedBorder: focusedBorder,
      ),
    );
  }
}
