import 'package:connect/module/auth/data/auth_models.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';

/// Talks to the backend Auth API. Throws ApiException on failure (handled by ApiController).
class AuthRepository {
  final ApiController _api = ApiController.instance;

  Future<OtpRequestResult> requestOtp({required String phone, String? shopCode}) async {
    final res = await _api.post(EndPoints.OTP_REQUEST, body: {
      'phone': phone,
      if (shopCode != null && shopCode.isNotEmpty) 'shopCode': shopCode,
    });
    return OtpRequestResult.fromJson(res.data as Map<String, dynamic>);
  }

  Future<TokenResponse> verifyOtp({
    required String requestId,
    required String phone,
    required String otp,
    String? shopCode,
    String? fcmToken,
    DeviceInfoData? device,
  }) async {
    final res = await _api.post(EndPoints.OTP_VERIFY, body: {
      'requestId': requestId,
      'phone': phone,
      'otp': otp,
      if (shopCode != null && shopCode.isNotEmpty) 'shopCode': shopCode,
      if (fcmToken != null && fcmToken.isNotEmpty) 'fcmToken': fcmToken,
      if (device != null) 'deviceInfo': device.toJson(),
    });
    return TokenResponse.fromJson(res.data as Map<String, dynamic>);
  }

  Future<AppUser> me() async {
    final res = await _api.get(EndPoints.ME);
    return AppUser.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> logout({required String refreshToken}) async {
    await _api.post(EndPoints.LOGOUT, body: {'refreshToken': refreshToken});
  }

  /// Register this device's FCM token with the backend (POST /account/devices).
  Future<void> registerDevice({
    required String fcmToken,
    String? platform,
    String? appVersion,
  }) async {
    await _api.post(EndPoints.DEVICES, body: {
      'fcmToken': fcmToken,
      if (platform != null) 'platform': platform,
      if (appVersion != null) 'appVersion': appVersion,
    });
  }
}
