import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_style.dart';

/// Builds the app theme for the given brightness. Assumes [AppColors.isDark]
/// has already been set to match, so the tokens resolve correctly.
ThemeData buildAppTheme(bool dark) {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: dark ? Brightness.dark : Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    surface: AppColors.scaffold,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: dark ? Brightness.dark : Brightness.light,
    fontFamily: AppTextStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.scaffold,
    colorScheme: scheme,
    dividerColor: AppColors.divider,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffold,
      surfaceTintColor: AppColors.scaffold,
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
    ),
  );
}
