/// State for the login flow (kept separate from the app-wide session).
/// Owns [isLoading] so the button reflects it, and carries the OTP-step data
/// between the phone and OTP screens without constructor drilling.
class AuthState {
  final bool isLoading;
  final String? requestId;
  final String? phone;
  final String? devOtp;
  final String? shopCode;
  final int resendAfter;

  const AuthState({
    this.isLoading = false,
    this.requestId,
    this.phone,
    this.devOtp,
    this.shopCode,
    this.resendAfter = 30,
  });

  AuthState copyWith({
    bool? isLoading,
    String? requestId,
    String? phone,
    String? devOtp,
    String? shopCode,
    int? resendAfter,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      requestId: requestId ?? this.requestId,
      phone: phone ?? this.phone,
      devOtp: devOtp ?? this.devOtp,
      shopCode: shopCode ?? this.shopCode,
      resendAfter: resendAfter ?? this.resendAfter,
    );
  }

  factory AuthState.initial() => const AuthState();
}
