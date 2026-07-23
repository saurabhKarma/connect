import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextSwatch<T> {
  TextSwatch(this._swatch);

  @protected
  final Map<T, TextStyle> _swatch;

  TextStyle? operator [](T index) => _swatch[index];
}

class TextStyleWeights extends TextSwatch<dynamic> {
  TextStyleWeights(super.swatch);

  TextStyle get w100 => this[100]!;
  TextStyle get w200 => this[200]!;
  TextStyle get w300 => this[300]!;
  TextStyle get w400 => this[400]!;
  TextStyle get w500 => this[500]!;
  TextStyle get w600 => this[600]!;
  TextStyle get w700 => this[700]!;
  TextStyle get w800 => this[800]!;
  TextStyle get w900 => this[900]!;
}

class AppTextStyles extends TextStyleWeights {
  AppTextStyles(super.swatch);

  static Color get textColor => AppColors.textPrimary;

  static String? get fontFamily => GoogleFonts.manrope().fontFamily;

  static AppTextStyles _make(double size) {
    TextStyle mk(FontWeight weight) => GoogleFonts.manrope(fontSize: size.sp, color: textColor, fontWeight: weight);
    return AppTextStyles(<int, TextStyle>{
      100: mk(FontWeight.w100),
      200: mk(FontWeight.w200),
      300: mk(FontWeight.w300),
      400: mk(FontWeight.w400),
      500: mk(FontWeight.w500),
      600: mk(FontWeight.w600),
      700: mk(FontWeight.w700),
      800: mk(FontWeight.w800),
      900: mk(FontWeight.w900),
    });
  }

  static AppTextStyles get style10px => _make(10);
  static AppTextStyles get style11px => _make(11);
  static AppTextStyles get style12px => _make(12);
  static AppTextStyles get style13px => _make(13);
  static AppTextStyles get style14px => _make(14);
  static AppTextStyles get style16px => _make(16);
  static AppTextStyles get style18px => _make(18);
  static AppTextStyles get style19px => _make(19);
  static AppTextStyles get style20px => _make(20);
  static AppTextStyles get style21px => _make(21);
  static AppTextStyles get style22px => _make(22);
  static AppTextStyles get style24px => _make(24);
  static AppTextStyles get style26px => _make(26);
  static AppTextStyles get style28px => _make(28);
  static AppTextStyles get style30px => _make(30);
  static AppTextStyles get style32px => _make(32);
  static AppTextStyles get style34px => _make(34);
  static AppTextStyles get style36px => _make(36);
}
