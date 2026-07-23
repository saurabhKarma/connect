import 'dart:convert';
import 'dart:io';
import 'dart:math' show log, pow, ln10;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:connect/res/local_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/simple_log.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Utility {
  static Future<String> getDeviceName() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      String manufacturer = androidInfo.manufacturer;
      String model = androidInfo.model;
      if (model.toLowerCase().startsWith(manufacturer.toLowerCase())) {
        return model.toUpperCase();
      } else {
        return '${manufacturer.toUpperCase()} $model';
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.name.toUpperCase();
    }
    return '';
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    if (cleanNumber.isEmpty) return;
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: cleanNumber,
    );
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        debugPrint('Could not launch dialer for $cleanNumber');
      }
    } catch (e) {
      debugPrint('Error launching dialer: $e');
    }
  }

  static bool isNull(dynamic value) => value == null;

  static bool isBlank(dynamic value) {
    return _isEmpty(value) ?? true;
  }

  static bool? _isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool?;
    }
    return false;
  }

  static String? capitalizeFirstCharacterOfWord(String s) {
    if (isNull(s)) return null;
    if (isBlank(s)) return s;
    return s.split(' ').map((word) => word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}' : '').join(' ');
  }

  static RegExp userIdRegex = RegExp(r'[a-zA-Z0-9]');
  static RegExp nameRegex = RegExp(r'[a-zA-Z ]');
  static RegExp addressRegex = RegExp(r'[a-zA-Z0-9 .,-]');
  static RegExp searchRegex = RegExp(r'[a-zA-Z0-9 _.+,-]');
  static RegExp emailRegex = RegExp(r'[a-zA-Z0-9 @_.-]');
  static RegExp describeRegex = RegExp(r'[a-zA-Z0-9 @_.+,]');

  static String maskEmail(String email) {
    if (!email.contains('@')) return email; // If not a valid email, return as is
    final parts = email.split('@');
    final localPart = parts[0];
    final domain = parts[1];

    if (localPart.length <= 2) {
      return '${localPart[0]}*@$domain';
    }

    final maskedLocal = localPart.replaceRange(1, localPart.length - 1, '*' * (localPart.length - 2));
    return '$maskedLocal@$domain';
  }

  static String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 4) return phoneNumber; // If too short, return as is
    return phoneNumber.replaceRange(0, phoneNumber.length - 4, '*' * (phoneNumber.length - 4));
  }

  static Future<String> pickImg(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      File file = File(image?.path ?? '');
      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      return base64Image;
    } catch (e) {
      return '';
    }
  }

  static String getCustomTimeBasedGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) {
      return 'Good Afternoon';
    } else if (hour >= 16 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  static String getFormattedDoubleValue(String value) {
    // Parse the string to double
    double originalDouble = double.parse(value);

    // Format the double to display only two decimal places
    NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');
    String formattedString = formatter.format(originalDouble);

    return formattedString;
  }

  static String getFormattedDoubleValueInRs(String value) {
    // Parse the string to double
    double originalDouble = double.parse(value);

    // Format the double to display only two decimal places
    NumberFormat formatter = NumberFormat('₹#,##0.00', 'en_US');
    String formattedString = formatter.format(originalDouble);

    return formattedString;
  }

  static String getFormattedDate(String value, {String? currentFormat, String? outputFormat}) {
    // Parse the string to double
    DateTime? dateTime = DateFormat(currentFormat ?? 'dd/MM/yyyy').tryParse(value);
    if (dateTime != null) {
      DateFormat displayFormat = DateFormat(outputFormat ?? 'd MMM, yyyy');
      String formattedString = displayFormat.format(dateTime);
      return formattedString;
    }
    return value;
  }

  static String getFormattedCountDown(int value) {
    final minutes = value ~/ 60;
    final seconds = value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static sendEmail(String emailId, {String? subject, String? body}) {
    try {
      String urlString = 'mailto:$emailId?subject=${subject ?? ''}&body=${body ?? ''}';
      launchUrlString(urlString);
    } catch (e) {
      SimpleLogger.debug(Utility, e.toString());
    }
  }

  static makeCall(String number) async {
    final Uri telUri = Uri(scheme: 'tel', path: '+91 $number');

    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    }
  }

  /// Launch a generic URL (e.g., website, document, deep link)
  static Future<bool> launchWebUrl(String url, {LaunchMode mode = LaunchMode.externalApplication}) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: mode);
      return true;
    } catch (e) {
      debugPrint('Error launching web URL: $e');
      return false;
    }
  }

  /// Launch a mail client with prefilled subject and body
  static Future<bool> launchEmail({required String email, String subject = '', String body = ''}) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{if (subject.isNotEmpty) 'subject': subject, if (body.isNotEmpty) 'body': body}),
    );
    return await _safeLaunch(uri);
  }

  /// Launch phone dialer with a given phone number
  static Future<bool> launchPhone(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    return await _safeLaunch(uri);
  }

  /// Launch SMS app with prefilled message
  static Future<bool> launchSMS(String phoneNumber, {String message = ''}) async {
    final Uri uri = Uri(scheme: 'sms', path: phoneNumber, query: _encodeQueryParameters(<String, String>{if (message.isNotEmpty) 'body': message}));
    return await _safeLaunch(uri);
  }

  /// Launch WhatsApp chat (works if WhatsApp installed)
  static Future<bool> launchWhatsApp(String phoneNumber, {String message = ''}) async {
    final Uri uri = Uri.parse("https://wa.me/$phoneNumber${message.isNotEmpty ? '?text=${Uri.encodeComponent(message)}' : ''}");
    return await launchWebUrl(uri.toString(), mode: LaunchMode.externalApplication);
  }

  /// Open a local file (e.g., PDF, image)
  static Future<bool> openLocalFile(String filePath) async {
    try {
      final uri = Uri.file(filePath);
      if (Platform.isAndroid || Platform.isIOS) {
        return await _safeLaunch(uri);
      } else {
        return await launchWebUrl(uri.toString());
      }
    } catch (e) {
      debugPrint('Error opening local file: $e');
      return false;
    }
  }

  /// Helper to safely launch URLs
  static Future<bool> _safeLaunch(Uri uri) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return true;
      } else {
        debugPrint('Cannot launch: $uri');
        return false;
      }
    } catch (e) {
      debugPrint('Error launching: $e');
      return false;
    }
  }

  /// Helper to encode query parameters
  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  static final defaultPinTheme = PinTheme(
    // width: 50,
    // height: 50,
    textStyle: AppTextStyles.style18px.w400.copyWith(color: const Color(0xFF222222)),
    decoration: BoxDecoration(
      color: white,
      border: Border.all(color: const Color(0xFF222222)),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static double getRoundedInterval(double maxValue) {
    if (maxValue <= 0) return 1;

    // Step 1: initial interval
    double rawInterval = maxValue / 5;

    // Step 2: find magnitude (like 10, 100, 1000)
    double magnitude = pow(10, (log(rawInterval) / ln10).floor()).toDouble();

    // Step 3: scale to a "nice" number (1, 2, 5, 10)
    double normalized = rawInterval / magnitude;

    double niceNumber;
    if (normalized <= 1) {
      niceNumber = 1;
    } else if (normalized <= 2) {
      niceNumber = 2;
    } else if (normalized <= 5) {
      niceNumber = 5;
    } else {
      niceNumber = 10;
    }

    // Step 4: return the adjusted interval
    return niceNumber * magnitude;
  }

  static List<T> syncListsById<T>(
    List<T> a,
    List<T> b,
    String Function(T item) idSelector,
  ) {
    final Map<String, T> mapA = {for (final item in a) idSelector(item): item};
    final Map<String, T> mapB = {for (final item in b) idSelector(item): item};

    final List<T> updatedList = [];

    // 1. Keep existing items from A if their ID exists in B
    for (final id in mapA.keys) {
      if (mapB.containsKey(id)) {
        updatedList.add(mapA[id] as T); // Keep original from A
      }
    }

    // 2. Add new items that exist only in B
    for (final id in mapB.keys) {
      if (!mapA.containsKey(id)) {
        updatedList.add(mapB[id] as T); // Add new from B
      }
    }

    return updatedList;
  }


  static Future<bool>  requestStoragePermissions() async {
    if (Platform.isAndroid) {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final androidDevice = await deviceInfo.androidInfo;
      if (androidDevice.version.sdkInt >= 33) {
        // Android 13+
        final result = await Permission.photos.request();
        return result.isGranted;
      } else {
        // Android 12 or below
        final result = await Permission.storage.request();
        return result.isGranted;
      }
    }
    return true;
  }

  static String fileExtension(String path) {
    final extension = path.split('.').last.toLowerCase();
    // return extension;
    return switch (extension) {
      'zip' => 'application/zip',
      'pdf' => 'application/pdf',
      _ => 'application/octet-stream',
    };
  }
}

extension MonthStringExtension on String {
  /// Converts a month name (e.g. "January") to a two-digit month number (e.g. "01").
  /// Throws [ArgumentError] if the month name is invalid.
  String toMonthNumber() {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final index = months.indexWhere(
      (m) => m.toLowerCase() == trim().toLowerCase(),
    );

    if (index == -1) {
      throw ArgumentError('Invalid month name: $this');
    }

    return index < 9 ? '0${index + 1}' : '${index + 1}';
  }

// Example usage:
// void main() {
//   final date = DateTime(2025, 11, 17);
//   print('Full English: ${date.monthName()}');        // Output: Full English: November
//   print('Short English: ${date.monthName(short: true)}'); // Output: Short English: Nov
//   print('Full Spanish: ${date.monthName(locale: 'es')}'); // Output: Full Spanish: noviembre
// }
}

extension DateTimeMonthName on DateTime {
  /// Returns the full month name (e.g., "November") for the given DateTime.
  ///
  /// [locale] is an optional parameter to specify the language (e.g., 'es' for Spanish).
  /// If [short] is true, returns the abbreviated name (e.g., "Nov").
  String monthName({String locale = 'en_US', bool short = false}) {
    // Determine the format string based on the 'short' flag
    final formatString = short ? 'MMM' : 'MMMM';

    // Use DateFormat to format the DateTime object
    return DateFormat(formatString, locale).format(this);
  }
}
