// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broadcast_api_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BroadcastItem {

 String get id; String? get message; String? get mediaUrl; String? get mediaType; String get status; int get recipientCount; int get sentCount; int get failedCount; DateTime get createdAt; DateTime? get sentAt;
/// Create a copy of BroadcastItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastItemCopyWith<BroadcastItem> get copyWith => _$BroadcastItemCopyWithImpl<BroadcastItem>(this as BroadcastItem, _$identity);

  /// Serializes this BroadcastItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastItem&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&(identical(other.recipientCount, recipientCount) || other.recipientCount == recipientCount)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount)&&(identical(other.failedCount, failedCount) || other.failedCount == failedCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,mediaUrl,mediaType,status,recipientCount,sentCount,failedCount,createdAt,sentAt);

@override
String toString() {
  return 'BroadcastItem(id: $id, message: $message, mediaUrl: $mediaUrl, mediaType: $mediaType, status: $status, recipientCount: $recipientCount, sentCount: $sentCount, failedCount: $failedCount, createdAt: $createdAt, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class $BroadcastItemCopyWith<$Res>  {
  factory $BroadcastItemCopyWith(BroadcastItem value, $Res Function(BroadcastItem) _then) = _$BroadcastItemCopyWithImpl;
@useResult
$Res call({
 String id, String? message, String? mediaUrl, String? mediaType, String status, int recipientCount, int sentCount, int failedCount, DateTime createdAt, DateTime? sentAt
});




}
/// @nodoc
class _$BroadcastItemCopyWithImpl<$Res>
    implements $BroadcastItemCopyWith<$Res> {
  _$BroadcastItemCopyWithImpl(this._self, this._then);

  final BroadcastItem _self;
  final $Res Function(BroadcastItem) _then;

/// Create a copy of BroadcastItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = freezed,Object? mediaUrl = freezed,Object? mediaType = freezed,Object? status = null,Object? recipientCount = null,Object? sentCount = null,Object? failedCount = null,Object? createdAt = null,Object? sentAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,recipientCount: null == recipientCount ? _self.recipientCount : recipientCount // ignore: cast_nullable_to_non_nullable
as int,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,failedCount: null == failedCount ? _self.failedCount : failedCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastItem].
extension BroadcastItemPatterns on BroadcastItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastItem value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastItem value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? message,  String? mediaUrl,  String? mediaType,  String status,  int recipientCount,  int sentCount,  int failedCount,  DateTime createdAt,  DateTime? sentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastItem() when $default != null:
return $default(_that.id,_that.message,_that.mediaUrl,_that.mediaType,_that.status,_that.recipientCount,_that.sentCount,_that.failedCount,_that.createdAt,_that.sentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? message,  String? mediaUrl,  String? mediaType,  String status,  int recipientCount,  int sentCount,  int failedCount,  DateTime createdAt,  DateTime? sentAt)  $default,) {final _that = this;
switch (_that) {
case _BroadcastItem():
return $default(_that.id,_that.message,_that.mediaUrl,_that.mediaType,_that.status,_that.recipientCount,_that.sentCount,_that.failedCount,_that.createdAt,_that.sentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? message,  String? mediaUrl,  String? mediaType,  String status,  int recipientCount,  int sentCount,  int failedCount,  DateTime createdAt,  DateTime? sentAt)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastItem() when $default != null:
return $default(_that.id,_that.message,_that.mediaUrl,_that.mediaType,_that.status,_that.recipientCount,_that.sentCount,_that.failedCount,_that.createdAt,_that.sentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadcastItem implements BroadcastItem {
  const _BroadcastItem({required this.id, this.message, this.mediaUrl, this.mediaType, required this.status, this.recipientCount = 0, this.sentCount = 0, this.failedCount = 0, required this.createdAt, this.sentAt});
  factory _BroadcastItem.fromJson(Map<String, dynamic> json) => _$BroadcastItemFromJson(json);

@override final  String id;
@override final  String? message;
@override final  String? mediaUrl;
@override final  String? mediaType;
@override final  String status;
@override@JsonKey() final  int recipientCount;
@override@JsonKey() final  int sentCount;
@override@JsonKey() final  int failedCount;
@override final  DateTime createdAt;
@override final  DateTime? sentAt;

/// Create a copy of BroadcastItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastItemCopyWith<_BroadcastItem> get copyWith => __$BroadcastItemCopyWithImpl<_BroadcastItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastItem&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.status, status) || other.status == status)&&(identical(other.recipientCount, recipientCount) || other.recipientCount == recipientCount)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount)&&(identical(other.failedCount, failedCount) || other.failedCount == failedCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,message,mediaUrl,mediaType,status,recipientCount,sentCount,failedCount,createdAt,sentAt);

@override
String toString() {
  return 'BroadcastItem(id: $id, message: $message, mediaUrl: $mediaUrl, mediaType: $mediaType, status: $status, recipientCount: $recipientCount, sentCount: $sentCount, failedCount: $failedCount, createdAt: $createdAt, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class _$BroadcastItemCopyWith<$Res> implements $BroadcastItemCopyWith<$Res> {
  factory _$BroadcastItemCopyWith(_BroadcastItem value, $Res Function(_BroadcastItem) _then) = __$BroadcastItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String? message, String? mediaUrl, String? mediaType, String status, int recipientCount, int sentCount, int failedCount, DateTime createdAt, DateTime? sentAt
});




}
/// @nodoc
class __$BroadcastItemCopyWithImpl<$Res>
    implements _$BroadcastItemCopyWith<$Res> {
  __$BroadcastItemCopyWithImpl(this._self, this._then);

  final _BroadcastItem _self;
  final $Res Function(_BroadcastItem) _then;

/// Create a copy of BroadcastItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = freezed,Object? mediaUrl = freezed,Object? mediaType = freezed,Object? status = null,Object? recipientCount = null,Object? sentCount = null,Object? failedCount = null,Object? createdAt = null,Object? sentAt = freezed,}) {
  return _then(_BroadcastItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,recipientCount: null == recipientCount ? _self.recipientCount : recipientCount // ignore: cast_nullable_to_non_nullable
as int,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,failedCount: null == failedCount ? _self.failedCount : failedCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BroadcastPage {

 List<BroadcastItem> get content; int get page; int get size; int get totalElements; int get totalPages;
/// Create a copy of BroadcastPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastPageCopyWith<BroadcastPage> get copyWith => _$BroadcastPageCopyWithImpl<BroadcastPage>(this as BroadcastPage, _$identity);

  /// Serializes this BroadcastPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastPage&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'BroadcastPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $BroadcastPageCopyWith<$Res>  {
  factory $BroadcastPageCopyWith(BroadcastPage value, $Res Function(BroadcastPage) _then) = _$BroadcastPageCopyWithImpl;
@useResult
$Res call({
 List<BroadcastItem> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class _$BroadcastPageCopyWithImpl<$Res>
    implements $BroadcastPageCopyWith<$Res> {
  _$BroadcastPageCopyWithImpl(this._self, this._then);

  final BroadcastPage _self;
  final $Res Function(BroadcastPage) _then;

/// Create a copy of BroadcastPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<BroadcastItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastPage].
extension BroadcastPagePatterns on BroadcastPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastPage value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastPage value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BroadcastItem> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BroadcastItem> content,  int page,  int size,  int totalElements,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _BroadcastPage():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BroadcastItem> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadcastPage implements BroadcastPage {
  const _BroadcastPage({final  List<BroadcastItem> content = const <BroadcastItem>[], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0}): _content = content;
  factory _BroadcastPage.fromJson(Map<String, dynamic> json) => _$BroadcastPageFromJson(json);

 final  List<BroadcastItem> _content;
@override@JsonKey() List<BroadcastItem> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;

/// Create a copy of BroadcastPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastPageCopyWith<_BroadcastPage> get copyWith => __$BroadcastPageCopyWithImpl<_BroadcastPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastPage&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'BroadcastPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$BroadcastPageCopyWith<$Res> implements $BroadcastPageCopyWith<$Res> {
  factory _$BroadcastPageCopyWith(_BroadcastPage value, $Res Function(_BroadcastPage) _then) = __$BroadcastPageCopyWithImpl;
@override @useResult
$Res call({
 List<BroadcastItem> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class __$BroadcastPageCopyWithImpl<$Res>
    implements _$BroadcastPageCopyWith<$Res> {
  __$BroadcastPageCopyWithImpl(this._self, this._then);

  final _BroadcastPage _self;
  final $Res Function(_BroadcastPage) _then;

/// Create a copy of BroadcastPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_BroadcastPage(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<BroadcastItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RecipientDelivery {

 String? get userId; String? get name; String get phone; String get status;// PENDING | SENT | FAILED | NO_DEVICE | SUPPRESSED | READ
 String? get failureReason; DateTime? get deliveredAt; DateTime? get readAt;
/// Create a copy of RecipientDelivery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientDeliveryCopyWith<RecipientDelivery> get copyWith => _$RecipientDeliveryCopyWithImpl<RecipientDelivery>(this as RecipientDelivery, _$identity);

  /// Serializes this RecipientDelivery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipientDelivery&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,phone,status,failureReason,deliveredAt,readAt);

@override
String toString() {
  return 'RecipientDelivery(userId: $userId, name: $name, phone: $phone, status: $status, failureReason: $failureReason, deliveredAt: $deliveredAt, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $RecipientDeliveryCopyWith<$Res>  {
  factory $RecipientDeliveryCopyWith(RecipientDelivery value, $Res Function(RecipientDelivery) _then) = _$RecipientDeliveryCopyWithImpl;
@useResult
$Res call({
 String? userId, String? name, String phone, String status, String? failureReason, DateTime? deliveredAt, DateTime? readAt
});




}
/// @nodoc
class _$RecipientDeliveryCopyWithImpl<$Res>
    implements $RecipientDeliveryCopyWith<$Res> {
  _$RecipientDeliveryCopyWithImpl(this._self, this._then);

  final RecipientDelivery _self;
  final $Res Function(RecipientDelivery) _then;

/// Create a copy of RecipientDelivery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? name = freezed,Object? phone = null,Object? status = null,Object? failureReason = freezed,Object? deliveredAt = freezed,Object? readAt = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipientDelivery].
extension RecipientDeliveryPatterns on RecipientDelivery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipientDelivery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipientDelivery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipientDelivery value)  $default,){
final _that = this;
switch (_that) {
case _RecipientDelivery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipientDelivery value)?  $default,){
final _that = this;
switch (_that) {
case _RecipientDelivery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId,  String? name,  String phone,  String status,  String? failureReason,  DateTime? deliveredAt,  DateTime? readAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipientDelivery() when $default != null:
return $default(_that.userId,_that.name,_that.phone,_that.status,_that.failureReason,_that.deliveredAt,_that.readAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId,  String? name,  String phone,  String status,  String? failureReason,  DateTime? deliveredAt,  DateTime? readAt)  $default,) {final _that = this;
switch (_that) {
case _RecipientDelivery():
return $default(_that.userId,_that.name,_that.phone,_that.status,_that.failureReason,_that.deliveredAt,_that.readAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId,  String? name,  String phone,  String status,  String? failureReason,  DateTime? deliveredAt,  DateTime? readAt)?  $default,) {final _that = this;
switch (_that) {
case _RecipientDelivery() when $default != null:
return $default(_that.userId,_that.name,_that.phone,_that.status,_that.failureReason,_that.deliveredAt,_that.readAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipientDelivery implements RecipientDelivery {
  const _RecipientDelivery({this.userId, this.name, required this.phone, required this.status, this.failureReason, this.deliveredAt, this.readAt});
  factory _RecipientDelivery.fromJson(Map<String, dynamic> json) => _$RecipientDeliveryFromJson(json);

@override final  String? userId;
@override final  String? name;
@override final  String phone;
@override final  String status;
// PENDING | SENT | FAILED | NO_DEVICE | SUPPRESSED | READ
@override final  String? failureReason;
@override final  DateTime? deliveredAt;
@override final  DateTime? readAt;

/// Create a copy of RecipientDelivery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipientDeliveryCopyWith<_RecipientDelivery> get copyWith => __$RecipientDeliveryCopyWithImpl<_RecipientDelivery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipientDeliveryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipientDelivery&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,phone,status,failureReason,deliveredAt,readAt);

@override
String toString() {
  return 'RecipientDelivery(userId: $userId, name: $name, phone: $phone, status: $status, failureReason: $failureReason, deliveredAt: $deliveredAt, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class _$RecipientDeliveryCopyWith<$Res> implements $RecipientDeliveryCopyWith<$Res> {
  factory _$RecipientDeliveryCopyWith(_RecipientDelivery value, $Res Function(_RecipientDelivery) _then) = __$RecipientDeliveryCopyWithImpl;
@override @useResult
$Res call({
 String? userId, String? name, String phone, String status, String? failureReason, DateTime? deliveredAt, DateTime? readAt
});




}
/// @nodoc
class __$RecipientDeliveryCopyWithImpl<$Res>
    implements _$RecipientDeliveryCopyWith<$Res> {
  __$RecipientDeliveryCopyWithImpl(this._self, this._then);

  final _RecipientDelivery _self;
  final $Res Function(_RecipientDelivery) _then;

/// Create a copy of RecipientDelivery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? name = freezed,Object? phone = null,Object? status = null,Object? failureReason = freezed,Object? deliveredAt = freezed,Object? readAt = freezed,}) {
  return _then(_RecipientDelivery(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BroadcastDetail {

 BroadcastItem get broadcast; List<RecipientDelivery> get recipients;
/// Create a copy of BroadcastDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastDetailCopyWith<BroadcastDetail> get copyWith => _$BroadcastDetailCopyWithImpl<BroadcastDetail>(this as BroadcastDetail, _$identity);

  /// Serializes this BroadcastDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastDetail&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&const DeepCollectionEquality().equals(other.recipients, recipients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,broadcast,const DeepCollectionEquality().hash(recipients));

@override
String toString() {
  return 'BroadcastDetail(broadcast: $broadcast, recipients: $recipients)';
}


}

/// @nodoc
abstract mixin class $BroadcastDetailCopyWith<$Res>  {
  factory $BroadcastDetailCopyWith(BroadcastDetail value, $Res Function(BroadcastDetail) _then) = _$BroadcastDetailCopyWithImpl;
@useResult
$Res call({
 BroadcastItem broadcast, List<RecipientDelivery> recipients
});


$BroadcastItemCopyWith<$Res> get broadcast;

}
/// @nodoc
class _$BroadcastDetailCopyWithImpl<$Res>
    implements $BroadcastDetailCopyWith<$Res> {
  _$BroadcastDetailCopyWithImpl(this._self, this._then);

  final BroadcastDetail _self;
  final $Res Function(BroadcastDetail) _then;

/// Create a copy of BroadcastDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? broadcast = null,Object? recipients = null,}) {
  return _then(_self.copyWith(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as BroadcastItem,recipients: null == recipients ? _self.recipients : recipients // ignore: cast_nullable_to_non_nullable
as List<RecipientDelivery>,
  ));
}
/// Create a copy of BroadcastDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastItemCopyWith<$Res> get broadcast {
  
  return $BroadcastItemCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}


/// Adds pattern-matching-related methods to [BroadcastDetail].
extension BroadcastDetailPatterns on BroadcastDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastDetail value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastDetail value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BroadcastItem broadcast,  List<RecipientDelivery> recipients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastDetail() when $default != null:
return $default(_that.broadcast,_that.recipients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BroadcastItem broadcast,  List<RecipientDelivery> recipients)  $default,) {final _that = this;
switch (_that) {
case _BroadcastDetail():
return $default(_that.broadcast,_that.recipients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BroadcastItem broadcast,  List<RecipientDelivery> recipients)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastDetail() when $default != null:
return $default(_that.broadcast,_that.recipients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadcastDetail implements BroadcastDetail {
  const _BroadcastDetail({required this.broadcast, final  List<RecipientDelivery> recipients = const <RecipientDelivery>[]}): _recipients = recipients;
  factory _BroadcastDetail.fromJson(Map<String, dynamic> json) => _$BroadcastDetailFromJson(json);

@override final  BroadcastItem broadcast;
 final  List<RecipientDelivery> _recipients;
@override@JsonKey() List<RecipientDelivery> get recipients {
  if (_recipients is EqualUnmodifiableListView) return _recipients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipients);
}


/// Create a copy of BroadcastDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastDetailCopyWith<_BroadcastDetail> get copyWith => __$BroadcastDetailCopyWithImpl<_BroadcastDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastDetail&&(identical(other.broadcast, broadcast) || other.broadcast == broadcast)&&const DeepCollectionEquality().equals(other._recipients, _recipients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,broadcast,const DeepCollectionEquality().hash(_recipients));

@override
String toString() {
  return 'BroadcastDetail(broadcast: $broadcast, recipients: $recipients)';
}


}

/// @nodoc
abstract mixin class _$BroadcastDetailCopyWith<$Res> implements $BroadcastDetailCopyWith<$Res> {
  factory _$BroadcastDetailCopyWith(_BroadcastDetail value, $Res Function(_BroadcastDetail) _then) = __$BroadcastDetailCopyWithImpl;
@override @useResult
$Res call({
 BroadcastItem broadcast, List<RecipientDelivery> recipients
});


@override $BroadcastItemCopyWith<$Res> get broadcast;

}
/// @nodoc
class __$BroadcastDetailCopyWithImpl<$Res>
    implements _$BroadcastDetailCopyWith<$Res> {
  __$BroadcastDetailCopyWithImpl(this._self, this._then);

  final _BroadcastDetail _self;
  final $Res Function(_BroadcastDetail) _then;

/// Create a copy of BroadcastDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? broadcast = null,Object? recipients = null,}) {
  return _then(_BroadcastDetail(
broadcast: null == broadcast ? _self.broadcast : broadcast // ignore: cast_nullable_to_non_nullable
as BroadcastItem,recipients: null == recipients ? _self._recipients : recipients // ignore: cast_nullable_to_non_nullable
as List<RecipientDelivery>,
  ));
}

/// Create a copy of BroadcastDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BroadcastItemCopyWith<$Res> get broadcast {
  
  return $BroadcastItemCopyWith<$Res>(_self.broadcast, (value) {
    return _then(_self.copyWith(broadcast: value));
  });
}
}

// dart format on
