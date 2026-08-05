import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast_api_models.freezed.dart';
part 'broadcast_api_models.g.dart';

/// A broadcast the user sent (mirrors backend BroadcastResponse).
@freezed
abstract class BroadcastItem with _$BroadcastItem {
  const factory BroadcastItem({
    required String id,
    String? message,
    String? mediaUrl,
    String? mediaType,
    required String status,
    @Default(0) int recipientCount,
    @Default(0) int sentCount,
    @Default(0) int failedCount,
    required DateTime createdAt,
    DateTime? sentAt,
  }) = _BroadcastItem;

  factory BroadcastItem.fromJson(Map<String, dynamic> json) => _$BroadcastItemFromJson(json);
}

@freezed
abstract class BroadcastPage with _$BroadcastPage {
  const factory BroadcastPage({
    @Default(<BroadcastItem>[]) List<BroadcastItem> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
  }) = _BroadcastPage;

  factory BroadcastPage.fromJson(Map<String, dynamic> json) => _$BroadcastPageFromJson(json);
}

/// Per-recipient delivery row.
@freezed
abstract class RecipientDelivery with _$RecipientDelivery {
  const factory RecipientDelivery({
    String? userId,
    String? name,
    required String phone,
    required String status, // PENDING | SENT | FAILED | NO_DEVICE | SUPPRESSED | READ
    String? failureReason,
    DateTime? deliveredAt,
    DateTime? readAt,
  }) = _RecipientDelivery;

  factory RecipientDelivery.fromJson(Map<String, dynamic> json) => _$RecipientDeliveryFromJson(json);
}

@freezed
abstract class BroadcastDetail with _$BroadcastDetail {
  const factory BroadcastDetail({
    required BroadcastItem broadcast,
    @Default(<RecipientDelivery>[]) List<RecipientDelivery> recipients,
  }) = _BroadcastDetail;

  factory BroadcastDetail.fromJson(Map<String, dynamic> json) => _$BroadcastDetailFromJson(json);
}
