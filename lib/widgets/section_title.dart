import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';

/// Bold section header used above grouped content (e.g. "Details", "Settings").
class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textPrimary));
  }
}
