// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broadcast_list_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BroadcastListSummary {

 String get id; String get name; int get memberCount; String? get lastMessagePreview; DateTime? get lastMessageAt;
/// Create a copy of BroadcastListSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastListSummaryCopyWith<BroadcastListSummary> get copyWith => _$BroadcastListSummaryCopyWithImpl<BroadcastListSummary>(this as BroadcastListSummary, _$identity);

  /// Serializes this BroadcastListSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastListSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,memberCount,lastMessagePreview,lastMessageAt);

@override
String toString() {
  return 'BroadcastListSummary(id: $id, name: $name, memberCount: $memberCount, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt)';
}


}

/// @nodoc
abstract mixin class $BroadcastListSummaryCopyWith<$Res>  {
  factory $BroadcastListSummaryCopyWith(BroadcastListSummary value, $Res Function(BroadcastListSummary) _then) = _$BroadcastListSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, int memberCount, String? lastMessagePreview, DateTime? lastMessageAt
});




}
/// @nodoc
class _$BroadcastListSummaryCopyWithImpl<$Res>
    implements $BroadcastListSummaryCopyWith<$Res> {
  _$BroadcastListSummaryCopyWithImpl(this._self, this._then);

  final BroadcastListSummary _self;
  final $Res Function(BroadcastListSummary) _then;

/// Create a copy of BroadcastListSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? memberCount = null,Object? lastMessagePreview = freezed,Object? lastMessageAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastListSummary].
extension BroadcastListSummaryPatterns on BroadcastListSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastListSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastListSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastListSummary value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastListSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastListSummary value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastListSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int memberCount,  String? lastMessagePreview,  DateTime? lastMessageAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastListSummary() when $default != null:
return $default(_that.id,_that.name,_that.memberCount,_that.lastMessagePreview,_that.lastMessageAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int memberCount,  String? lastMessagePreview,  DateTime? lastMessageAt)  $default,) {final _that = this;
switch (_that) {
case _BroadcastListSummary():
return $default(_that.id,_that.name,_that.memberCount,_that.lastMessagePreview,_that.lastMessageAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int memberCount,  String? lastMessagePreview,  DateTime? lastMessageAt)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastListSummary() when $default != null:
return $default(_that.id,_that.name,_that.memberCount,_that.lastMessagePreview,_that.lastMessageAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadcastListSummary implements BroadcastListSummary {
  const _BroadcastListSummary({required this.id, required this.name, this.memberCount = 0, this.lastMessagePreview, this.lastMessageAt});
  factory _BroadcastListSummary.fromJson(Map<String, dynamic> json) => _$BroadcastListSummaryFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  int memberCount;
@override final  String? lastMessagePreview;
@override final  DateTime? lastMessageAt;

/// Create a copy of BroadcastListSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastListSummaryCopyWith<_BroadcastListSummary> get copyWith => __$BroadcastListSummaryCopyWithImpl<_BroadcastListSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastListSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastListSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,memberCount,lastMessagePreview,lastMessageAt);

@override
String toString() {
  return 'BroadcastListSummary(id: $id, name: $name, memberCount: $memberCount, lastMessagePreview: $lastMessagePreview, lastMessageAt: $lastMessageAt)';
}


}

/// @nodoc
abstract mixin class _$BroadcastListSummaryCopyWith<$Res> implements $BroadcastListSummaryCopyWith<$Res> {
  factory _$BroadcastListSummaryCopyWith(_BroadcastListSummary value, $Res Function(_BroadcastListSummary) _then) = __$BroadcastListSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int memberCount, String? lastMessagePreview, DateTime? lastMessageAt
});




}
/// @nodoc
class __$BroadcastListSummaryCopyWithImpl<$Res>
    implements _$BroadcastListSummaryCopyWith<$Res> {
  __$BroadcastListSummaryCopyWithImpl(this._self, this._then);

  final _BroadcastListSummary _self;
  final $Res Function(_BroadcastListSummary) _then;

/// Create a copy of BroadcastListSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? memberCount = null,Object? lastMessagePreview = freezed,Object? lastMessageAt = freezed,}) {
  return _then(_BroadcastListSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BroadcastListMemberUi {

 String get phone; String? get name; bool get hasApp;
/// Create a copy of BroadcastListMemberUi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastListMemberUiCopyWith<BroadcastListMemberUi> get copyWith => _$BroadcastListMemberUiCopyWithImpl<BroadcastListMemberUi>(this as BroadcastListMemberUi, _$identity);

  /// Serializes this BroadcastListMemberUi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastListMemberUi&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.hasApp, hasApp) || other.hasApp == hasApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,name,hasApp);

@override
String toString() {
  return 'BroadcastListMemberUi(phone: $phone, name: $name, hasApp: $hasApp)';
}


}

/// @nodoc
abstract mixin class $BroadcastListMemberUiCopyWith<$Res>  {
  factory $BroadcastListMemberUiCopyWith(BroadcastListMemberUi value, $Res Function(BroadcastListMemberUi) _then) = _$BroadcastListMemberUiCopyWithImpl;
@useResult
$Res call({
 String phone, String? name, bool hasApp
});




}
/// @nodoc
class _$BroadcastListMemberUiCopyWithImpl<$Res>
    implements $BroadcastListMemberUiCopyWith<$Res> {
  _$BroadcastListMemberUiCopyWithImpl(this._self, this._then);

  final BroadcastListMemberUi _self;
  final $Res Function(BroadcastListMemberUi) _then;

/// Create a copy of BroadcastListMemberUi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? name = freezed,Object? hasApp = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,hasApp: null == hasApp ? _self.hasApp : hasApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastListMemberUi].
extension BroadcastListMemberUiPatterns on BroadcastListMemberUi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastListMemberUi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastListMemberUi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastListMemberUi value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastListMemberUi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastListMemberUi value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastListMemberUi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String? name,  bool hasApp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastListMemberUi() when $default != null:
return $default(_that.phone,_that.name,_that.hasApp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String? name,  bool hasApp)  $default,) {final _that = this;
switch (_that) {
case _BroadcastListMemberUi():
return $default(_that.phone,_that.name,_that.hasApp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String? name,  bool hasApp)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastListMemberUi() when $default != null:
return $default(_that.phone,_that.name,_that.hasApp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadcastListMemberUi implements BroadcastListMemberUi {
  const _BroadcastListMemberUi({required this.phone, this.name, this.hasApp = false});
  factory _BroadcastListMemberUi.fromJson(Map<String, dynamic> json) => _$BroadcastListMemberUiFromJson(json);

@override final  String phone;
@override final  String? name;
@override@JsonKey() final  bool hasApp;

/// Create a copy of BroadcastListMemberUi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastListMemberUiCopyWith<_BroadcastListMemberUi> get copyWith => __$BroadcastListMemberUiCopyWithImpl<_BroadcastListMemberUi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastListMemberUiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastListMemberUi&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.hasApp, hasApp) || other.hasApp == hasApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,name,hasApp);

@override
String toString() {
  return 'BroadcastListMemberUi(phone: $phone, name: $name, hasApp: $hasApp)';
}


}

/// @nodoc
abstract mixin class _$BroadcastListMemberUiCopyWith<$Res> implements $BroadcastListMemberUiCopyWith<$Res> {
  factory _$BroadcastListMemberUiCopyWith(_BroadcastListMemberUi value, $Res Function(_BroadcastListMemberUi) _then) = __$BroadcastListMemberUiCopyWithImpl;
@override @useResult
$Res call({
 String phone, String? name, bool hasApp
});




}
/// @nodoc
class __$BroadcastListMemberUiCopyWithImpl<$Res>
    implements _$BroadcastListMemberUiCopyWith<$Res> {
  __$BroadcastListMemberUiCopyWithImpl(this._self, this._then);

  final _BroadcastListMemberUi _self;
  final $Res Function(_BroadcastListMemberUi) _then;

/// Create a copy of BroadcastListMemberUi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? name = freezed,Object? hasApp = null,}) {
  return _then(_BroadcastListMemberUi(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,hasApp: null == hasApp ? _self.hasApp : hasApp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BroadcastListDetail {

 String get id; String get name; List<BroadcastListMemberUi> get members;
/// Create a copy of BroadcastListDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastListDetailCopyWith<BroadcastListDetail> get copyWith => _$BroadcastListDetailCopyWithImpl<BroadcastListDetail>(this as BroadcastListDetail, _$identity);

  /// Serializes this BroadcastListDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastListDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.members, members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(members));

@override
String toString() {
  return 'BroadcastListDetail(id: $id, name: $name, members: $members)';
}


}

/// @nodoc
abstract mixin class $BroadcastListDetailCopyWith<$Res>  {
  factory $BroadcastListDetailCopyWith(BroadcastListDetail value, $Res Function(BroadcastListDetail) _then) = _$BroadcastListDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<BroadcastListMemberUi> members
});




}
/// @nodoc
class _$BroadcastListDetailCopyWithImpl<$Res>
    implements $BroadcastListDetailCopyWith<$Res> {
  _$BroadcastListDetailCopyWithImpl(this._self, this._then);

  final BroadcastListDetail _self;
  final $Res Function(BroadcastListDetail) _then;

/// Create a copy of BroadcastListDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? members = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<BroadcastListMemberUi>,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastListDetail].
extension BroadcastListDetailPatterns on BroadcastListDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastListDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastListDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastListDetail value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastListDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastListDetail value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastListDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<BroadcastListMemberUi> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastListDetail() when $default != null:
return $default(_that.id,_that.name,_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<BroadcastListMemberUi> members)  $default,) {final _that = this;
switch (_that) {
case _BroadcastListDetail():
return $default(_that.id,_that.name,_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<BroadcastListMemberUi> members)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastListDetail() when $default != null:
return $default(_that.id,_that.name,_that.members);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadcastListDetail implements BroadcastListDetail {
  const _BroadcastListDetail({required this.id, required this.name, final  List<BroadcastListMemberUi> members = const <BroadcastListMemberUi>[]}): _members = members;
  factory _BroadcastListDetail.fromJson(Map<String, dynamic> json) => _$BroadcastListDetailFromJson(json);

@override final  String id;
@override final  String name;
 final  List<BroadcastListMemberUi> _members;
@override@JsonKey() List<BroadcastListMemberUi> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of BroadcastListDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastListDetailCopyWith<_BroadcastListDetail> get copyWith => __$BroadcastListDetailCopyWithImpl<_BroadcastListDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastListDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastListDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'BroadcastListDetail(id: $id, name: $name, members: $members)';
}


}

/// @nodoc
abstract mixin class _$BroadcastListDetailCopyWith<$Res> implements $BroadcastListDetailCopyWith<$Res> {
  factory _$BroadcastListDetailCopyWith(_BroadcastListDetail value, $Res Function(_BroadcastListDetail) _then) = __$BroadcastListDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<BroadcastListMemberUi> members
});




}
/// @nodoc
class __$BroadcastListDetailCopyWithImpl<$Res>
    implements _$BroadcastListDetailCopyWith<$Res> {
  __$BroadcastListDetailCopyWithImpl(this._self, this._then);

  final _BroadcastListDetail _self;
  final $Res Function(_BroadcastListDetail) _then;

/// Create a copy of BroadcastListDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? members = null,}) {
  return _then(_BroadcastListDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<BroadcastListMemberUi>,
  ));
}


}


/// @nodoc
mixin _$ListMessage {

 String get id; String? get message; String? get mediaUrl; String? get mediaType; int get recipientCount; int get sentCount; String get status; DateTime get createdAt;
/// Create a copy of ListMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListMessageCopyWith<ListMessage> get copyWith => _$ListMessageCopyWithImpl<ListMessage>(this as ListMessage, _$identity);

  /// Serializes this ListMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.recipientCount, recipientCount) || other.recipientCount == recipientCount)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,mediaUrl,mediaType,recipientCount,sentCount,status,createdAt);

@override
String toString() {
  return 'ListMessage(id: $id, message: $message, mediaUrl: $mediaUrl, mediaType: $mediaType, recipientCount: $recipientCount, sentCount: $sentCount, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ListMessageCopyWith<$Res>  {
  factory $ListMessageCopyWith(ListMessage value, $Res Function(ListMessage) _then) = _$ListMessageCopyWithImpl;
@useResult
$Res call({
 String id, String? message, String? mediaUrl, String? mediaType, int recipientCount, int sentCount, String status, DateTime createdAt
});




}
/// @nodoc
class _$ListMessageCopyWithImpl<$Res>
    implements $ListMessageCopyWith<$Res> {
  _$ListMessageCopyWithImpl(this._self, this._then);

  final ListMessage _self;
  final $Res Function(ListMessage) _then;

/// Create a copy of ListMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = freezed,Object? mediaUrl = freezed,Object? mediaType = freezed,Object? recipientCount = null,Object? sentCount = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,recipientCount: null == recipientCount ? _self.recipientCount : recipientCount // ignore: cast_nullable_to_non_nullable
as int,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ListMessage].
extension ListMessagePatterns on ListMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListMessage value)  $default,){
final _that = this;
switch (_that) {
case _ListMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ListMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? message,  String? mediaUrl,  String? mediaType,  int recipientCount,  int sentCount,  String status,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListMessage() when $default != null:
return $default(_that.id,_that.message,_that.mediaUrl,_that.mediaType,_that.recipientCount,_that.sentCount,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? message,  String? mediaUrl,  String? mediaType,  int recipientCount,  int sentCount,  String status,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ListMessage():
return $default(_that.id,_that.message,_that.mediaUrl,_that.mediaType,_that.recipientCount,_that.sentCount,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? message,  String? mediaUrl,  String? mediaType,  int recipientCount,  int sentCount,  String status,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ListMessage() when $default != null:
return $default(_that.id,_that.message,_that.mediaUrl,_that.mediaType,_that.recipientCount,_that.sentCount,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListMessage implements ListMessage {
  const _ListMessage({required this.id, this.message, this.mediaUrl, this.mediaType, this.recipientCount = 0, this.sentCount = 0, required this.status, required this.createdAt});
  factory _ListMessage.fromJson(Map<String, dynamic> json) => _$ListMessageFromJson(json);

@override final  String id;
@override final  String? message;
@override final  String? mediaUrl;
@override final  String? mediaType;
@override@JsonKey() final  int recipientCount;
@override@JsonKey() final  int sentCount;
@override final  String status;
@override final  DateTime createdAt;

/// Create a copy of ListMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListMessageCopyWith<_ListMessage> get copyWith => __$ListMessageCopyWithImpl<_ListMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.recipientCount, recipientCount) || other.recipientCount == recipientCount)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,mediaUrl,mediaType,recipientCount,sentCount,status,createdAt);

@override
String toString() {
  return 'ListMessage(id: $id, message: $message, mediaUrl: $mediaUrl, mediaType: $mediaType, recipientCount: $recipientCount, sentCount: $sentCount, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ListMessageCopyWith<$Res> implements $ListMessageCopyWith<$Res> {
  factory _$ListMessageCopyWith(_ListMessage value, $Res Function(_ListMessage) _then) = __$ListMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String? message, String? mediaUrl, String? mediaType, int recipientCount, int sentCount, String status, DateTime createdAt
});




}
/// @nodoc
class __$ListMessageCopyWithImpl<$Res>
    implements _$ListMessageCopyWith<$Res> {
  __$ListMessageCopyWithImpl(this._self, this._then);

  final _ListMessage _self;
  final $Res Function(_ListMessage) _then;

/// Create a copy of ListMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = freezed,Object? mediaUrl = freezed,Object? mediaType = freezed,Object? recipientCount = null,Object? sentCount = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_ListMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,recipientCount: null == recipientCount ? _self.recipientCount : recipientCount // ignore: cast_nullable_to_non_nullable
as int,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
