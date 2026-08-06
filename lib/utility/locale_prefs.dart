import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Persists the in-app language choice so it survives restarts.
class LocalePrefs {
  static const _storage = FlutterSecureStorage();
  static const _key = 'app_language_code';

  static Future<String?> getLanguageCode() async {
    try {
      return await _storage.read(key: _key);
    } catch (_) {
      return null; // corrupted secure store -> default language
    }
  }

  static Future<void> setLanguageCode(String code) =>
      _storage.write(key: _key, value: code);
}
