import 'package:flutter/material.dart';

import 'local_colors.dart';
class AppColors {
  AppColors._();

  static bool isDark = false;

  // Brand (same in both modes)
  static const Color primary = Color(0xFF44B28D); // Mitra green
  static const Color primaryDark = Color(0xFF2E8B6F);
  static const Color onPrimary = white;
  static const Color accent = orange;
  static const Color brandText = Color(0xFF14233A);
  static const Color danger = Color(0xFFE53935);
  static const Color success = Color(0xFF2E7D32);

  // Surfaces
  static Color get scaffold => isDark ? const Color(0xFF121212) : white;
  static Color get surface => isDark ? const Color(0xFF1E1F22) : const Color(0xFFF6F7F9);
  static Color get card => isDark ? const Color(0xFF1E1F22) : white;
  static Color get border => isDark ? const Color(0xFF33353A) : grey100;
  static Color get inputBorder => isDark ? const Color(0xFF44474D) : grey400;
  static Color get divider => isDark ? const Color(0xFF33353A) : dividerColor;

  // Text / icons
  static Color get textPrimary => isDark ? const Color(0xFFECECEC) : grey900;
  static Color get textSecondary => isDark ? const Color(0xFF9BA0A6) : const Color(0xFF53565A);
  static Color get textHint => isDark ? const Color(0xFF6B7075) : grey300;
  static Color get icon => isDark ? const Color(0xFFB8BCC2) : grey700;

  // States
  static Color get disabled => isDark ? const Color(0xFF2A2C30) : grey100;
  static Color get onDisabled => isDark ? const Color(0xFF6B7075) : grey300;
}
