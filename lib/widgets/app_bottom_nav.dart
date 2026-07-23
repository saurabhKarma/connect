import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The app's bottom navigation: Home, Broadcast, Settings.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffold,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _item(0, PhosphorIconsFill.house, PhosphorIconsRegular.house, l10n.home),
            _item(1, PhosphorIconsFill.broadcast, PhosphorIconsRegular.broadcast, l10n.broadcast),
            _item(2, PhosphorIconsFill.gearSix, PhosphorIconsRegular.gearSix, l10n.settings),
          ],
        ),
      ),
    );
  }

  Widget _item(int index, IconData active, IconData inactive, String label) {
    final selected = currentIndex == index;
    final color = selected ? AppColors.textPrimary : AppColors.textSecondary;
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(selected ? active : inactive, color: color, size: 24.sp),
            SizedBox(height: 4.h),
            Text(
              label,
              style: (selected ? AppTextStyles.style12px.w700 : AppTextStyles.style12px.w500)
                  .copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
