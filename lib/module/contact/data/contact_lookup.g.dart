// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhoneStatus _$PhoneStatusFromJson(Map<String, dynamic> json) => _PhoneStatus(
  phone: json['phone'] as String,
  hasApp: json['hasApp'] as bool? ?? false,
  userId: json['userId'] as String?,
);

Map<String, dynamic> _$PhoneStatusToJson(_PhoneStatus instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'hasApp': instance.hasApp,
      'userId': instance.userId,
    };
