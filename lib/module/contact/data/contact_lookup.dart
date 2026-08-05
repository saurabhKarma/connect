import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_lookup.freezed.dart';
part 'contact_lookup.g.dart';

/// Result of checking whether a phone number has a Mitra account.
/// hasApp=false → offer a share_plus invite; hasApp=true → start chat / broadcast by userId.
@freezed
abstract class PhoneStatus with _$PhoneStatus {
  const factory PhoneStatus({
    required String phone,
    @Default(false) bool hasApp,
    String? userId,
  }) = _PhoneStatus;

  factory PhoneStatus.fromJson(Map<String, dynamic> json) => _$PhoneStatusFromJson(json);
}
