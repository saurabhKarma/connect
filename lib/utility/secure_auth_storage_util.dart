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

  static Future<String?> getAccessToken() => _storage.read(key: _keyAccessToken);

  static Future<String?> getRefreshToken() => _storage.read(key: _keyRefreshToken);

  static Future<void> clearAuthData() async {
    await _storage.deleteAll();
  }
}
