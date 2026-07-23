import 'package:dio/dio.dart';
import 'package:connect/network/dio_http_client.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/utility/secure_auth_storage_util.dart';

class TokenRefreshInterceptor extends Interceptor {
  late final Dio _refreshDio;
  bool _isRefreshing = false;

  TokenRefreshInterceptor() {
    _refreshDio = Dio(
      BaseOptions(
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  // Auth endpoints legitimately return 401 (bad OTP / expired session) — never try to refresh those.
  bool _isAuthPath(String path) =>
      path.contains('/auth/otp/') || path.contains('/auth/token/refresh') || path.contains('/auth/login');

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;

    if (status == 401 && !_isRefreshing && !_isAuthPath(err.requestOptions.path)) {
      _isRefreshing = true;

      final refreshToken = await SecureAuthStorageUtil.getRefreshToken();
      if (refreshToken == null) {
        _isRefreshing = false;
        await SecureAuthStorageUtil.clearAuthData();
        return handler.next(err);
      }

      try {
        final response = await _refreshDio.post(EndPoints.REFRESH_TOKEN, data: {"refreshToken": refreshToken});
        // Backend returns a flat body: { accessToken, refreshToken, expiresIn }
        final data = response.data as Map<String, dynamic>;

        await SecureAuthStorageUtil.saveAuthData(
          accessToken: data['accessToken'] as String,
          refreshToken: data['refreshToken'] as String,
        );

        _isRefreshing = false;

        final newToken = await SecureAuthStorageUtil.getAccessToken();
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

        final retryResponse = await DioSingleton().dio.fetch(err.requestOptions);
        return handler.resolve(retryResponse);
      } catch (e) {
        _isRefreshing = false;
        await SecureAuthStorageUtil.clearAuthData();
        return handler.next(err);
      }
    }
    handler.next(err);
  }
}