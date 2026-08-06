import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureAuthStorageUtil {
  static const _storage = FlutterSecureStorage();

  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  static Future<void> saveAuthData({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _storage.write(key: _keyAccessToken, value: accessToken);
    if (refreshToken != null) {
      await _storage.write(key: _keyRefreshToken, value: refreshToken);
    }
  }

  static Future<String?> getAccessToken() => _read(_keyAccessToken);

  static Future<String?> getRefreshToken() => _read(_keyRefreshToken);

  /// Reads a key; if the secure store can't be decrypted (e.g. reinstall / backup restore
  /// leaves a stale key -> BadPaddingException), wipe it and start clean instead of crashing.
  static Future<String?> _read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (_) {
      await clearAuthData();
      return null;
    }
  }

  static Future<void> clearAuthData() async {
    try {
      await _storage.deleteAll();
    } catch (_) {/* ignore */}
  }
}
