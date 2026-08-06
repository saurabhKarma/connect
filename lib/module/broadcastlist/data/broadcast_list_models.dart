import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast_list_models.freezed.dart';
part 'broadcast_list_models.g.dart';

/// A broadcast list row for the Broadcast tab.
@freezed
abstract class BroadcastListSummary with _$BroadcastListSummary {
  const factory BroadcastListSummary({
    required String id,
    required String name,
    @Default(0) int memberCount,
    String? lastMessagePreview,
    DateTime? lastMessageAt,
  }) = _BroadcastListSummary;

  factory BroadcastListSummary.fromJson(Map<String, dynamic> json) =>
      _$BroadcastListSummaryFromJson(json);
}

@freezed
abstract class BroadcastListMemberUi with _$BroadcastListMemberUi {
  const factory BroadcastListMemberUi({
    required String phone,
    String? name,
    @Default(false) bool hasApp,
  }) = _BroadcastListMemberUi;

  factory BroadcastListMemberUi.fromJson(Map<String, dynamic> json) =>
      _$BroadcastListMemberUiFromJson(json);
}

@freezed
abstract class BroadcastListDetail with _$BroadcastListDetail {
  const factory BroadcastListDetail({
    required String id,
    required String name,
    @Default(<BroadcastListMemberUi>[]) List<BroadcastListMemberUi> members,
  }) = _BroadcastListDetail;

  factory BroadcastListDetail.fromJson(Map<String, dynamic> json) =>
      _$BroadcastListDetailFromJson(json);
}

/// One past broadcast sent to a list (an outgoing bubble in the list thread).
@freezed
abstract class ListMessage with _$ListMessage {
  const factory ListMessage({
    required String id,
    String? message,
    String? mediaUrl,
    String? mediaType,
    @Default(0) int recipientCount,
    @Default(0) int sentCount,
    required String status,
    required DateTime createdAt,
  }) = _ListMessage;

  factory ListMessage.fromJson(Map<String, dynamic> json) => _$ListMessageFromJson(json);
}
