import 'dart:io';
import 'package:flutter/services.dart';

class NativeFileOpener {
  static const MethodChannel _channel = MethodChannel('native_file_opener');

  static Future<bool> openFile(String filePath, {String? mimeType}) async {
    try {
      final result = await _channel.invokeMethod('openFile', {
        'filePath': filePath,
        'mimeType': mimeType,
      });
      return result == true;
    } catch (e) {
      print("Error opening file: $e");
      return false;
    }
  }
}
