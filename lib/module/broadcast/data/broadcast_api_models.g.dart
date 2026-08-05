// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BroadcastItem _$BroadcastItemFromJson(Map<String, dynamic> json) =>
    _BroadcastItem(
      id: json['id'] as String,
      message: json['message'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      mediaType: json['mediaType'] as String?,
      status: json['status'] as String,
      recipientCount: (json['recipientCount'] as num?)?.toInt() ?? 0,
      sentCount: (json['sentCount'] as num?)?.toInt() ?? 0,
      failedCount: (json['failedCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$BroadcastItemToJson(_BroadcastItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'mediaUrl': instance.mediaUrl,
      'mediaType': instance.mediaType,
      'status': instance.status,
      'recipientCount': instance.recipientCount,
      'sentCount': instance.sentCount,
      'failedCount': instance.failedCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'sentAt': instance.sentAt?.toIso8601String(),
    };

_BroadcastPage _$BroadcastPageFromJson(Map<String, dynamic> json) =>
    _BroadcastPage(
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => BroadcastItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BroadcastItem>[],
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BroadcastPageToJson(_BroadcastPage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };

_RecipientDelivery _$RecipientDeliveryFromJson(Map<String, dynamic> json) =>
    _RecipientDelivery(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String,
      status: json['status'] as String,
      failureReason: json['failureReason'] as String?,
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
    );

Map<String, dynamic> _$RecipientDeliveryToJson(_RecipientDelivery instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'phone': instance.phone,
      'status': instance.status,
      'failureReason': instance.failureReason,
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
    };

_BroadcastDetail _$BroadcastDetailFromJson(
  Map<String, dynamic> json,
) => _BroadcastDetail(
  broadcast: BroadcastItem.fromJson(json['broadcast'] as Map<String, dynamic>),
  recipients:
      (json['recipients'] as List<dynamic>?)
          ?.map((e) => RecipientDelivery.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RecipientDelivery>[],
);

Map<String, dynamic> _$BroadcastDetailToJson(_BroadcastDetail instance) =>
    <String, dynamic>{
      'broadcast': instance.broadcast,
      'recipients': instance.recipients,
    };
