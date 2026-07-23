import 'package:connect/app/locale_controller.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final current = ref.watch(localeControllerProvider).languageCode;

    return Scaffold(
      appBar: CommonAppBar(title: l10n.settings),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Text(l10n.language, style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          SizedBox(height: 8.h),
          _LanguageTile(
            label: l10n.english,
            selected: current == 'en',
            onTap: () => ref.read(localeControllerProvider.notifier).setLocale(const Locale('en')),
          ),
          SizedBox(height: 8.h),
          _LanguageTile(
            label: l10n.hindi,
            selected: current == 'hi',
            onTap: () => ref.read(localeControllerProvider.notifier).setLocale(const Locale('hi')),
          ),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageTile({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: selected ? AppColors.primary : AppColors.border),
        ),
        child: Row(
          children: [
            Expanded(child: Text(label, style: AppTextStyles.style16px.w600)),
            if (selected) Icon(Icons.check_circle, color: AppColors.primary, size: 22.sp),
          ],
        ),
      ),
    );
  }
}
