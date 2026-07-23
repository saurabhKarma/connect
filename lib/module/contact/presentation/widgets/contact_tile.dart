import 'package:connect/module/contact/data/contact_ui.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A contact row with avatar, name, phone, and a trailing select radio.
class SelectableContactTile extends StatelessWidget {
  final ContactUi contact;
  final bool selected;
  final VoidCallback onTap;

  const SelectableContactTile({
    super.key,
    required this.contact,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            UserAvatar(name: contact.name, size: 46, photo: contact.photo),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contact.name, style: AppTextStyles.style16px.w700),
                  SizedBox(height: 2.h),
                  Text(contact.phone,
                      style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            _radio(),
          ],
        ),
      ),
    );
  }

  Widget _radio() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? AppColors.primary : Colors.transparent,
        border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: 1.5),
      ),
      child: selected ? Icon(Icons.check, size: 15.sp, color: AppColors.onPrimary) : null,
    );
  }
}
