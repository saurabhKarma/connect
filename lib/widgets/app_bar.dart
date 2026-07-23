import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The single app bar used across the app. White surface, no elevation,
/// left-aligned bold title, automatic back button (like "← Verify OTP").
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBack;
  final Widget? leading;
  final VoidCallback? onBack;
  final PreferredSizeWidget? bottom;
  final double toolbarHeight;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = false,
    this.showBack = true,
    this.leading,
    this.onBack,
    this.bottom,
    this.toolbarHeight = kToolbarHeight,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final showLeading = leading != null || (showBack && canPop);

    return AppBar(
      backgroundColor: AppColors.scaffold,
      surfaceTintColor: AppColors.scaffold,
      elevation: 0,
      centerTitle: centerTitle,
      titleSpacing: showLeading ? 0 : 20.w,
      toolbarHeight: toolbarHeight,
      leading: leading ??
          (showBack && canPop
              ? IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.textPrimary, size: 22.sp),
                  onPressed: onBack ?? () => Navigator.of(context).maybePop(),
                )
              : null),
      title: Text(
        title,
        style: AppTextStyles.style20px.w700.copyWith(color: AppColors.textPrimary),
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}
