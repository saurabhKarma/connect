import 'package:connect/app/locale_controller.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The "अ / A" chip. Tapping toggles between Hindi and English instantly.
class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHindi = ref.watch(localeControllerProvider).languageCode == 'hi';

    return GestureDetector(
      onTap: () => ref.read(localeControllerProvider.notifier).toggle(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('अ', style: _style(isHindi)),
            Text(' / ', style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textHint)),
            Text('A', style: _style(!isHindi)),
          ],
        ),
      ),
    );
  }

  TextStyle _style(bool active) => AppTextStyles.style14px.w700.copyWith(
        color: active ? AppColors.primary : AppColors.textHint,
      );
}
