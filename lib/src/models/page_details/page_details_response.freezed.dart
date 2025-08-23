// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageDetailsResponse _$PageDetailsResponseFromJson(Map<String, dynamic> json) {
  return _PageDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$PageDetailsResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  PageDetailsResponseData? get data => throw _privateConstructorUsedError;

  /// Serializes this PageDetailsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageDetailsResponseCopyWith<PageDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageDetailsResponseCopyWith<$Res> {
  factory $PageDetailsResponseCopyWith(
          PageDetailsResponse value, $Res Function(PageDetailsResponse) then) =
      _$PageDetailsResponseCopyWithImpl<$Res, PageDetailsResponse>;
  @useResult
  $Res call({bool? success, String? message, PageDetailsResponseData? data});

  $PageDetailsResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PageDetailsResponseCopyWithImpl<$Res, $Val extends PageDetailsResponse>
    implements $PageDetailsResponseCopyWith<$Res> {
  _$PageDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PageDetailsResponseData?,
    ) as $Val);
  }

  /// Create a copy of PageDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageDetailsResponseDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PageDetailsResponseDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PageDetailsResponseImplCopyWith<$Res>
    implements $PageDetailsResponseCopyWith<$Res> {
  factory _$$PageDetailsResponseImplCopyWith(_$PageDetailsResponseImpl value,
          $Res Function(_$PageDetailsResponseImpl) then) =
      __$$PageDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, PageDetailsResponseData? data});

  @override
  $PageDetailsResponseDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PageDetailsResponseImplCopyWithImpl<$Res>
    extends _$PageDetailsResponseCopyWithImpl<$Res, _$PageDetailsResponseImpl>
    implements _$$PageDetailsResponseImplCopyWith<$Res> {
  __$$PageDetailsResponseImplCopyWithImpl(_$PageDetailsResponseImpl _value,
      $Res Function(_$PageDetailsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PageDetailsResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PageDetailsResponseData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageDetailsResponseImpl implements _PageDetailsResponse {
  const _$PageDetailsResponseImpl({this.success, this.message, this.data});

  factory _$PageDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageDetailsResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final PageDetailsResponseData? data;

  @override
  String toString() {
    return 'PageDetailsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageDetailsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of PageDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageDetailsResponseImplCopyWith<_$PageDetailsResponseImpl> get copyWith =>
      __$$PageDetailsResponseImplCopyWithImpl<_$PageDetailsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _PageDetailsResponse implements PageDetailsResponse {
  const factory _PageDetailsResponse(
      {final bool? success,
      final String? message,
      final PageDetailsResponseData? data}) = _$PageDetailsResponseImpl;

  factory _PageDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$PageDetailsResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  PageDetailsResponseData? get data;

  /// Create a copy of PageDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageDetailsResponseImplCopyWith<_$PageDetailsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PageDetailsResponseData _$PageDetailsResponseDataFromJson(
    Map<String, dynamic> json) {
  return _PageDetailsResponseData.fromJson(json);
}

/// @nodoc
mixin _$PageDetailsResponseData {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get pageType => throw _privateConstructorUsedError;
  List<Point> get points => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;

  /// Serializes this PageDetailsResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageDetailsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageDetailsResponseDataCopyWith<PageDetailsResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageDetailsResponseDataCopyWith<$Res> {
  factory $PageDetailsResponseDataCopyWith(PageDetailsResponseData value,
          $Res Function(PageDetailsResponseData) then) =
      _$PageDetailsResponseDataCopyWithImpl<$Res, PageDetailsResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String creatorId,
      String doctorId,
      int createdAt,
      int updatedAt,
      int pageNumber,
      int width,
      int height,
      String pageType,
      List<Point> points,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class _$PageDetailsResponseDataCopyWithImpl<$Res,
        $Val extends PageDetailsResponseData>
    implements $PageDetailsResponseDataCopyWith<$Res> {
  _$PageDetailsResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageDetailsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? doctorId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? pageNumber = null,
    Object? width = null,
    Object? height = null,
    Object? pageType = null,
    Object? points = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      pageType: null == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageDetailsResponseDataImplCopyWith<$Res>
    implements $PageDetailsResponseDataCopyWith<$Res> {
  factory _$$PageDetailsResponseDataImplCopyWith(
          _$PageDetailsResponseDataImpl value,
          $Res Function(_$PageDetailsResponseDataImpl) then) =
      __$$PageDetailsResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String creatorId,
      String doctorId,
      int createdAt,
      int updatedAt,
      int pageNumber,
      int width,
      int height,
      String pageType,
      List<Point> points,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class __$$PageDetailsResponseDataImplCopyWithImpl<$Res>
    extends _$PageDetailsResponseDataCopyWithImpl<$Res,
        _$PageDetailsResponseDataImpl>
    implements _$$PageDetailsResponseDataImplCopyWith<$Res> {
  __$$PageDetailsResponseDataImplCopyWithImpl(
      _$PageDetailsResponseDataImpl _value,
      $Res Function(_$PageDetailsResponseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageDetailsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? doctorId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? pageNumber = null,
    Object? width = null,
    Object? height = null,
    Object? pageType = null,
    Object? points = null,
    Object? v = null,
  }) {
    return _then(_$PageDetailsResponseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      pageType: null == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageDetailsResponseDataImpl implements _PageDetailsResponseData {
  const _$PageDetailsResponseDataImpl(
      {@JsonKey(name: "_id") required this.id,
      required this.creatorId,
      required this.doctorId,
      required this.createdAt,
      required this.updatedAt,
      required this.pageNumber,
      required this.width,
      required this.height,
      required this.pageType,
      required final List<Point> points,
      @JsonKey(name: '__v') required this.v})
      : _points = points;

  factory _$PageDetailsResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageDetailsResponseDataImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String creatorId;
  @override
  final String doctorId;
  @override
  final int createdAt;
  @override
  final int updatedAt;
  @override
  final int pageNumber;
  @override
  final int width;
  @override
  final int height;
  @override
  final String pageType;
  final List<Point> _points;
  @override
  List<Point> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  @JsonKey(name: '__v')
  final int v;

  @override
  String toString() {
    return 'PageDetailsResponseData(id: $id, creatorId: $creatorId, doctorId: $doctorId, createdAt: $createdAt, updatedAt: $updatedAt, pageNumber: $pageNumber, width: $width, height: $height, pageType: $pageType, points: $points, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageDetailsResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creatorId,
      doctorId,
      createdAt,
      updatedAt,
      pageNumber,
      width,
      height,
      pageType,
      const DeepCollectionEquality().hash(_points),
      v);

  /// Create a copy of PageDetailsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageDetailsResponseDataImplCopyWith<_$PageDetailsResponseDataImpl>
      get copyWith => __$$PageDetailsResponseDataImplCopyWithImpl<
          _$PageDetailsResponseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageDetailsResponseDataImplToJson(
      this,
    );
  }
}

abstract class _PageDetailsResponseData implements PageDetailsResponseData {
  const factory _PageDetailsResponseData(
          {@JsonKey(name: "_id") required final String id,
          required final String creatorId,
          required final String doctorId,
          required final int createdAt,
          required final int updatedAt,
          required final int pageNumber,
          required final int width,
          required final int height,
          required final String pageType,
          required final List<Point> points,
          @JsonKey(name: '__v') required final int v}) =
      _$PageDetailsResponseDataImpl;

  factory _PageDetailsResponseData.fromJson(Map<String, dynamic> json) =
      _$PageDetailsResponseDataImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get creatorId;
  @override
  String get doctorId;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  int get pageNumber;
  @override
  int get width;
  @override
  int get height;
  @override
  String get pageType;
  @override
  List<Point> get points;
  @override
  @JsonKey(name: '__v')
  int get v;

  /// Create a copy of PageDetailsResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageDetailsResponseDataImplCopyWith<_$PageDetailsResponseDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
mixin _$Point {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  @JsonKey(name: 'actionType')
  int get actionType => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this Point to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call(
      {int x,
      int y,
      @JsonKey(name: 'actionType') int actionType,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? actionType = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointImplCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$PointImplCopyWith(
          _$PointImpl value, $Res Function(_$PointImpl) then) =
      __$$PointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int x,
      int y,
      @JsonKey(name: 'actionType') int actionType,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$PointImplCopyWithImpl<$Res>
    extends _$PointCopyWithImpl<$Res, _$PointImpl>
    implements _$$PointImplCopyWith<$Res> {
  __$$PointImplCopyWithImpl(
      _$PointImpl _value, $Res Function(_$PointImpl) _then)
      : super(_value, _then);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? actionType = null,
    Object? id = freezed,
  }) {
    return _then(_$PointImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointImpl implements _Point {
  const _$PointImpl(
      {required this.x,
      required this.y,
      @JsonKey(name: 'actionType') required this.actionType,
      @JsonKey(name: '_id') this.id});

  factory _$PointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointImplFromJson(json);

  @override
  final int x;
  @override
  final int y;
  @override
  @JsonKey(name: 'actionType')
  final int actionType;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'Point(x: $x, y: $y, actionType: $actionType, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, actionType, id);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      __$$PointImplCopyWithImpl<_$PointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointImplToJson(
      this,
    );
  }
}

abstract class _Point implements Point {
  const factory _Point(
      {required final int x,
      required final int y,
      @JsonKey(name: 'actionType') required final int actionType,
      @JsonKey(name: '_id') final String? id}) = _$PointImpl;

  factory _Point.fromJson(Map<String, dynamic> json) = _$PointImpl.fromJson;

  @override
  int get x;
  @override
  int get y;
  @override
  @JsonKey(name: 'actionType')
  int get actionType;
  @override
  @JsonKey(name: '_id')
  String? get id;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
