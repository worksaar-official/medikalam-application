// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_point_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadPointRequest _$UploadPointRequestFromJson(Map<String, dynamic> json) {
  return _UploadPointRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadPointRequest {
  int get pageNumber => throw _privateConstructorUsedError;
  List<Points> get pointsToAdd => throw _privateConstructorUsedError;

  /// Serializes this UploadPointRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadPointRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadPointRequestCopyWith<UploadPointRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPointRequestCopyWith<$Res> {
  factory $UploadPointRequestCopyWith(
          UploadPointRequest value, $Res Function(UploadPointRequest) then) =
      _$UploadPointRequestCopyWithImpl<$Res, UploadPointRequest>;
  @useResult
  $Res call({int pageNumber, List<Points> pointsToAdd});
}

/// @nodoc
class _$UploadPointRequestCopyWithImpl<$Res, $Val extends UploadPointRequest>
    implements $UploadPointRequestCopyWith<$Res> {
  _$UploadPointRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadPointRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pointsToAdd = null,
  }) {
    return _then(_value.copyWith(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pointsToAdd: null == pointsToAdd
          ? _value.pointsToAdd
          : pointsToAdd // ignore: cast_nullable_to_non_nullable
              as List<Points>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadPointRequestImplCopyWith<$Res>
    implements $UploadPointRequestCopyWith<$Res> {
  factory _$$UploadPointRequestImplCopyWith(_$UploadPointRequestImpl value,
          $Res Function(_$UploadPointRequestImpl) then) =
      __$$UploadPointRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageNumber, List<Points> pointsToAdd});
}

/// @nodoc
class __$$UploadPointRequestImplCopyWithImpl<$Res>
    extends _$UploadPointRequestCopyWithImpl<$Res, _$UploadPointRequestImpl>
    implements _$$UploadPointRequestImplCopyWith<$Res> {
  __$$UploadPointRequestImplCopyWithImpl(_$UploadPointRequestImpl _value,
      $Res Function(_$UploadPointRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadPointRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pointsToAdd = null,
  }) {
    return _then(_$UploadPointRequestImpl(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pointsToAdd: null == pointsToAdd
          ? _value._pointsToAdd
          : pointsToAdd // ignore: cast_nullable_to_non_nullable
              as List<Points>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadPointRequestImpl implements _UploadPointRequest {
  const _$UploadPointRequestImpl(
      {required this.pageNumber, required final List<Points> pointsToAdd})
      : _pointsToAdd = pointsToAdd;

  factory _$UploadPointRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadPointRequestImplFromJson(json);

  @override
  final int pageNumber;
  final List<Points> _pointsToAdd;
  @override
  List<Points> get pointsToAdd {
    if (_pointsToAdd is EqualUnmodifiableListView) return _pointsToAdd;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pointsToAdd);
  }

  @override
  String toString() {
    return 'UploadPointRequest(pageNumber: $pageNumber, pointsToAdd: $pointsToAdd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPointRequestImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            const DeepCollectionEquality()
                .equals(other._pointsToAdd, _pointsToAdd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageNumber,
      const DeepCollectionEquality().hash(_pointsToAdd));

  /// Create a copy of UploadPointRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPointRequestImplCopyWith<_$UploadPointRequestImpl> get copyWith =>
      __$$UploadPointRequestImplCopyWithImpl<_$UploadPointRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPointRequestImplToJson(
      this,
    );
  }
}

abstract class _UploadPointRequest implements UploadPointRequest {
  const factory _UploadPointRequest(
      {required final int pageNumber,
      required final List<Points> pointsToAdd}) = _$UploadPointRequestImpl;

  factory _UploadPointRequest.fromJson(Map<String, dynamic> json) =
      _$UploadPointRequestImpl.fromJson;

  @override
  int get pageNumber;
  @override
  List<Points> get pointsToAdd;

  /// Create a copy of UploadPointRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadPointRequestImplCopyWith<_$UploadPointRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Points _$PointsFromJson(Map<String, dynamic> json) {
  return _Points.fromJson(json);
}

/// @nodoc
mixin _$Points {
  num get x => throw _privateConstructorUsedError;
  num get y => throw _privateConstructorUsedError;
  num get actionType => throw _privateConstructorUsedError;

  /// Serializes this Points to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Points
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointsCopyWith<Points> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsCopyWith<$Res> {
  factory $PointsCopyWith(Points value, $Res Function(Points) then) =
      _$PointsCopyWithImpl<$Res, Points>;
  @useResult
  $Res call({num x, num y, num actionType});
}

/// @nodoc
class _$PointsCopyWithImpl<$Res, $Val extends Points>
    implements $PointsCopyWith<$Res> {
  _$PointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Points
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? actionType = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as num,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as num,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointsImplCopyWith<$Res> implements $PointsCopyWith<$Res> {
  factory _$$PointsImplCopyWith(
          _$PointsImpl value, $Res Function(_$PointsImpl) then) =
      __$$PointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num x, num y, num actionType});
}

/// @nodoc
class __$$PointsImplCopyWithImpl<$Res>
    extends _$PointsCopyWithImpl<$Res, _$PointsImpl>
    implements _$$PointsImplCopyWith<$Res> {
  __$$PointsImplCopyWithImpl(
      _$PointsImpl _value, $Res Function(_$PointsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Points
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? actionType = null,
  }) {
    return _then(_$PointsImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as num,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as num,
      actionType: null == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointsImpl implements _Points {
  const _$PointsImpl(
      {required this.x, required this.y, required this.actionType});

  factory _$PointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointsImplFromJson(json);

  @override
  final num x;
  @override
  final num y;
  @override
  final num actionType;

  @override
  String toString() {
    return 'Points(x: $x, y: $y, actionType: $actionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, actionType);

  /// Create a copy of Points
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsImplCopyWith<_$PointsImpl> get copyWith =>
      __$$PointsImplCopyWithImpl<_$PointsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointsImplToJson(
      this,
    );
  }
}

abstract class _Points implements Points {
  const factory _Points(
      {required final num x,
      required final num y,
      required final num actionType}) = _$PointsImpl;

  factory _Points.fromJson(Map<String, dynamic> json) = _$PointsImpl.fromJson;

  @override
  num get x;
  @override
  num get y;
  @override
  num get actionType;

  /// Create a copy of Points
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointsImplCopyWith<_$PointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
