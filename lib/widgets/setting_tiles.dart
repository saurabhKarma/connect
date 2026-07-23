import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A row with a title, optional subtitle, and a switch (used inside a settings card).
class SettingToggleTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingToggleTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.style14px.w700),
                if (subtitle != null) ...[
                  SizedBox(height: 2.h),
                  Text(subtitle!,
                      style: AppTextStyles.style12px.w400.copyWith(color: AppColors.textSecondary)),
                ],
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

/// A tappable rounded card with a label and a trailing widget (chevron by default).
class SettingLinkTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingLinkTile({super.key, required this.title, this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Expanded(child: Text(title, style: AppTextStyles.style14px.w600)),
            trailing ?? Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20.sp),
          ],
        ),
      ),
    );
  }
}

/// A read-only labelled value card (e.g. Name, Phone Number in the profile).
class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  const InfoCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.style12px.w400.copyWith(color: AppColors.textSecondary)),
          SizedBox(height: 4.h),
          Text(value, style: AppTextStyles.style16px.w700),
        ],
      ),
    );
  }
}
