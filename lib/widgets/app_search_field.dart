import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Rounded pill search field with a leading search icon.
class AppSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const AppSearchField({super.key, this.controller, required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyles.style14px.w500,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.style14px.w400.copyWith(color: AppColors.textHint),
        prefixIcon: Icon(Icons.search, color: AppColors.textSecondary, size: 22.sp),
        filled: true,
        fillColor: AppColors.card,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        enabledBorder: _border(AppColors.border),
        focusedBorder: _border(AppColors.primary),
        border: _border(AppColors.border),
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: BorderSide(color: color),
      );
}
