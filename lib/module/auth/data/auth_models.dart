/// Plain immutable models for the Auth module (no codegen required).
/// These map 1:1 to the backend's flat JSON responses.

class OtpRequestResult {
  final String requestId;
  final int expiresIn;
  final int resendAfter;
  final String? maskedPhone;
  final String? devOtp; // populated only when backend runs in dev mode

  const OtpRequestResult({
    required this.requestId,
    required this.expiresIn,
    required this.resendAfter,
    this.maskedPhone,
    this.devOtp,
  });

  factory OtpRequestResult.fromJson(Map<String, dynamic> j) => OtpRequestResult(
        requestId: j['requestId'] as String,
        expiresIn: (j['expiresIn'] as num?)?.toInt() ?? 0,
        resendAfter: (j['resendAfter'] as num?)?.toInt() ?? 0,
        maskedPhone: j['maskedPhone'] as String?,
        devOtp: j['devOtp'] as String?,
      );
}

class SubscriptionInfo {
  final String? status;
  final String? plan;
  final String? validUntil;

  const SubscriptionInfo({this.status, this.plan, this.validUntil});

  factory SubscriptionInfo.fromJson(Map<String, dynamic> j) => SubscriptionInfo(
        status: j['status'] as String?,
        plan: j['plan'] as String?,
        validUntil: j['validUntil'] as String?,
      );
}

class AppUser {
  final String id;
  final String? phone;
  final String? name;
  final List<String> linkedShops;
  final bool isRetailer;
  final SubscriptionInfo? subscription;

  const AppUser({
    required this.id,
    this.phone,
    this.name,
    this.linkedShops = const [],
    this.isRetailer = false,
    this.subscription,
  });

  factory AppUser.fromJson(Map<String, dynamic> j) => AppUser(
        id: j['id'] as String,
        phone: j['phone'] as String?,
        name: j['name'] as String?,
        linkedShops:
            (j['linkedShops'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? const [],
        isRetailer: j['isRetailer'] as bool? ?? false,
        subscription: j['subscription'] == null
            ? null
            : SubscriptionInfo.fromJson(j['subscription'] as Map<String, dynamic>),
      );
}

class TokenResponse {
  final String accessToken;
  final String refreshToken;
  final String? tokenType;
  final int expiresIn;
  final bool isNewUser;
  final AppUser user;

  const TokenResponse({
    required this.accessToken,
    required this.refreshToken,
    this.tokenType,
    this.expiresIn = 0,
    this.isNewUser = false,
    required this.user,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> j) => TokenResponse(
        accessToken: j['accessToken'] as String,
        refreshToken: j['refreshToken'] as String,
        tokenType: j['tokenType'] as String?,
        expiresIn: (j['expiresIn'] as num?)?.toInt() ?? 0,
        isNewUser: j['isNewUser'] as bool? ?? false,
        user: AppUser.fromJson(j['user'] as Map<String, dynamic>),
      );
}

/// Sent inside OTP verify so the backend can register the device.
class DeviceInfoData {
  final String? platform;
  final String? appVersion;

  const DeviceInfoData({this.platform, this.appVersion});

  Map<String, dynamic> toJson() => {
        if (platform != null) 'platform': platform,
        if (appVersion != null) 'appVersion': appVersion,
      };
}
