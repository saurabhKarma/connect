import 'package:flutter/material.dart';

class ScaffoldToast {
  /// Core toast function
  static void _show({
    required BuildContext context,
    required String message,
    required Color bgColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    double borderRadius = 14,
    EdgeInsets margin = const EdgeInsets.only(bottom: 20, left: 20, right: 20),
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: bgColor,
        duration: duration,
        behavior: behavior,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        margin: margin,
        elevation: 8,
      ),
    );
  }

  /// Bottom error toast
  static void showErrorBottom(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      bgColor: Colors.red.shade600,
    );
  }

  /// Bottom success toast
  static void showSuccessBottom(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      bgColor: Colors.green.shade600,
    );
  }

  /// Center toast
  static void showCenter(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      bgColor: Colors.black87,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      behavior: SnackBarBehavior.floating,
    );
  }

  /// Top toast
  static void showTop(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      bgColor: Colors.blueGrey,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
    );
  }
}
