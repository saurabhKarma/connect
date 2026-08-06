// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_list_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BroadcastListSummary _$BroadcastListSummaryFromJson(
  Map<String, dynamic> json,
) => _BroadcastListSummary(
  id: json['id'] as String,
  name: json['name'] as String,
  memberCount: (json['memberCount'] as num?)?.toInt() ?? 0,
  lastMessagePreview: json['lastMessagePreview'] as String?,
  lastMessageAt: json['lastMessageAt'] == null
      ? null
      : DateTime.parse(json['lastMessageAt'] as String),
);

Map<String, dynamic> _$BroadcastListSummaryToJson(
  _BroadcastListSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'memberCount': instance.memberCount,
  'lastMessagePreview': instance.lastMessagePreview,
  'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
};

_BroadcastListMemberUi _$BroadcastListMemberUiFromJson(
  Map<String, dynamic> json,
) => _BroadcastListMemberUi(
  phone: json['phone'] as String,
  name: json['name'] as String?,
  hasApp: json['hasApp'] as bool? ?? false,
);

Map<String, dynamic> _$BroadcastListMemberUiToJson(
  _BroadcastListMemberUi instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'name': instance.name,
  'hasApp': instance.hasApp,
};

_BroadcastListDetail _$BroadcastListDetailFromJson(Map<String, dynamic> json) =>
    _BroadcastListDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      members:
          (json['members'] as List<dynamic>?)
              ?.map(
                (e) =>
                    BroadcastListMemberUi.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <BroadcastListMemberUi>[],
    );

Map<String, dynamic> _$BroadcastListDetailToJson(
  _BroadcastListDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'members': instance.members,
};

_ListMessage _$ListMessageFromJson(Map<String, dynamic> json) => _ListMessage(
  id: json['id'] as String,
  message: json['message'] as String?,
  mediaUrl: json['mediaUrl'] as String?,
  mediaType: json['mediaType'] as String?,
  recipientCount: (json['recipientCount'] as num?)?.toInt() ?? 0,
  sentCount: (json['sentCount'] as num?)?.toInt() ?? 0,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ListMessageToJson(_ListMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'mediaUrl': instance.mediaUrl,
      'mediaType': instance.mediaType,
      'recipientCount': instance.recipientCount,
      'sentCount': instance.sentCount,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
