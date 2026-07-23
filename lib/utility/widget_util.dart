import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connect/res/local_colors.dart';

Widget verticalSpace(double height) => SizedBox(height: height);

Widget horizontalSpace(double width) => SizedBox(width: width);

Widget line(Color? lineColor) => Container(
      width: double.maxFinite,
      height: 1,
      color: lineColor ?? dividerColor,
    );

extension ClickListener on Widget {
  Widget onClick(Function()? clickHandler) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: clickHandler,
      onTap: debounce(clickHandler),
      child: this,
    );
  }
}

debounce(Function? func, [int delay = 250]) {
  Timer? timer;
  return () {
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer(Duration(milliseconds: delay), () {
      if (func != null) {
        func();
      }
    });
  };
}

extension StringExtension on String {
  int? toInt() {
    return int.tryParse(this);
  }

  double? toDouble() {
    return double.tryParse(this);
  }

  num? toNumber() {
    return num.tryParse(this);
  }
}
