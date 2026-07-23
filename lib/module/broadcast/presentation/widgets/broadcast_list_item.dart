import 'package:connect/module/broadcast/data/broadcast_summary.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A broadcast thread row: avatar, name + last-message preview, and time.
class BroadcastListItem extends StatelessWidget {
  final BroadcastSummary broadcast;
  final VoidCallback? onTap;

  const BroadcastListItem({super.key, required this.broadcast, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52.w,
              height: 52.w,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(broadcast.name, style: AppTextStyles.style16px.w700),
                  SizedBox(height: 3.h),
                  Text(
                    broadcast.preview,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style13px.w500.copyWith(
                      color: broadcast.unread ? AppColors.primary : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(broadcast.time,
                style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
