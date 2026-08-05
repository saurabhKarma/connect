// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_lookup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhoneStatus {

 String get phone; bool get hasApp; String? get userId;
/// Create a copy of PhoneStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneStatusCopyWith<PhoneStatus> get copyWith => _$PhoneStatusCopyWithImpl<PhoneStatus>(this as PhoneStatus, _$identity);

  /// Serializes this PhoneStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneStatus&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hasApp, hasApp) || other.hasApp == hasApp)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,hasApp,userId);

@override
String toString() {
  return 'PhoneStatus(phone: $phone, hasApp: $hasApp, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $PhoneStatusCopyWith<$Res>  {
  factory $PhoneStatusCopyWith(PhoneStatus value, $Res Function(PhoneStatus) _then) = _$PhoneStatusCopyWithImpl;
@useResult
$Res call({
 String phone, bool hasApp, String? userId
});




}
/// @nodoc
class _$PhoneStatusCopyWithImpl<$Res>
    implements $PhoneStatusCopyWith<$Res> {
  _$PhoneStatusCopyWithImpl(this._self, this._then);

  final PhoneStatus _self;
  final $Res Function(PhoneStatus) _then;

/// Create a copy of PhoneStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? hasApp = null,Object? userId = freezed,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,hasApp: null == hasApp ? _self.hasApp : hasApp // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneStatus].
extension PhoneStatusPatterns on PhoneStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneStatus value)  $default,){
final _that = this;
switch (_that) {
case _PhoneStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneStatus value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  bool hasApp,  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneStatus() when $default != null:
return $default(_that.phone,_that.hasApp,_that.userId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  bool hasApp,  String? userId)  $default,) {final _that = this;
switch (_that) {
case _PhoneStatus():
return $default(_that.phone,_that.hasApp,_that.userId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  bool hasApp,  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _PhoneStatus() when $default != null:
return $default(_that.phone,_that.hasApp,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhoneStatus implements PhoneStatus {
  const _PhoneStatus({required this.phone, this.hasApp = false, this.userId});
  factory _PhoneStatus.fromJson(Map<String, dynamic> json) => _$PhoneStatusFromJson(json);

@override final  String phone;
@override@JsonKey() final  bool hasApp;
@override final  String? userId;

/// Create a copy of PhoneStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneStatusCopyWith<_PhoneStatus> get copyWith => __$PhoneStatusCopyWithImpl<_PhoneStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneStatus&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.hasApp, hasApp) || other.hasApp == hasApp)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,hasApp,userId);

@override
String toString() {
  return 'PhoneStatus(phone: $phone, hasApp: $hasApp, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$PhoneStatusCopyWith<$Res> implements $PhoneStatusCopyWith<$Res> {
  factory _$PhoneStatusCopyWith(_PhoneStatus value, $Res Function(_PhoneStatus) _then) = __$PhoneStatusCopyWithImpl;
@override @useResult
$Res call({
 String phone, bool hasApp, String? userId
});




}
/// @nodoc
class __$PhoneStatusCopyWithImpl<$Res>
    implements _$PhoneStatusCopyWith<$Res> {
  __$PhoneStatusCopyWithImpl(this._self, this._then);

  final _PhoneStatus _self;
  final $Res Function(_PhoneStatus) _then;

/// Create a copy of PhoneStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? hasApp = null,Object? userId = freezed,}) {
  return _then(_PhoneStatus(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,hasApp: null == hasApp ? _self.hasApp : hasApp // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
