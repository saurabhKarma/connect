import 'package:connect/res/app_colors.dart';
import 'package:connect/res/app_lottie.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

enum AppButtonVariant { primary, outline, text }

class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final AppButtonVariant variant;
  final IconData? icon;
  final String? svgIcon;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.svgIcon,
    this.height,
    this.width,
    this.margin,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _pressed = false;

  bool get _hardDisabled => !widget.enabled || widget.onPressed == null;
  bool get _interactive => !_hardDisabled && !widget.isLoading;

  void _setPressed(bool value) {
    if (!_interactive) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(14.r);
    final loading = widget.isLoading;
    final fg = _foreground();

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      onTap: _interactive ? widget.onPressed : null,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: widget.width ?? double.infinity,
          height: widget.height ?? 50.h,
          margin: widget.margin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: loading ? AppColors.card : _background(),
            borderRadius: radius,
            border: _border(loading),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: loading
                ? CircularProgressIndicator()
                // ? Lottie.asset(AppLottie.loading, height: 30.h, key: const ValueKey('loading'))
                : Row(
                    key: const ValueKey('label'),
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.label, style: AppTextStyles.style16px.w600.copyWith(color: fg)),
                      if (widget.icon != null) ...[
                        SizedBox(width: 6.w),
                        Icon(widget.icon, color: fg, size: 18.sp),
                      ],
                      if (widget.svgIcon != null) ...[
                        SizedBox(width: 6.w),
                        SvgPicture.asset(widget.svgIcon!, width: 16.w, height: 16.w),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Color _background() {
    if (_hardDisabled) return AppColors.disabled;
    switch (widget.variant) {
      case AppButtonVariant.primary:
        return AppColors.primary;
      case AppButtonVariant.outline:
      case AppButtonVariant.text:
        return AppColors.card;
    }
  }

  Color _foreground() {
    if (_hardDisabled) return AppColors.onDisabled;
    switch (widget.variant) {
      case AppButtonVariant.primary:
        return AppColors.onPrimary;
      case AppButtonVariant.outline:
      case AppButtonVariant.text:
        return AppColors.primary;
    }
  }

  BoxBorder? _border(bool loading) {
    if (loading) return Border.all(color: AppColors.primary);
    if (widget.variant == AppButtonVariant.outline) {
      return Border.all(color: _hardDisabled ? AppColors.border : AppColors.primary);
    }
    return null;
  }
}
