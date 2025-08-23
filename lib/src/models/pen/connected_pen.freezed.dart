// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_pen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConnectedPen _$ConnectedPenFromJson(Map<String, dynamic> json) {
  return _ConnectedPen.fromJson(json);
}

/// @nodoc
mixin _$ConnectedPen {
  String get macAddress => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  int? get batteryLevel => throw _privateConstructorUsedError;
  DateTime? get connectedAt => throw _privateConstructorUsedError;

  /// Serializes this ConnectedPen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConnectedPen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectedPenCopyWith<ConnectedPen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedPenCopyWith<$Res> {
  factory $ConnectedPenCopyWith(
          ConnectedPen value, $Res Function(ConnectedPen) then) =
      _$ConnectedPenCopyWithImpl<$Res, ConnectedPen>;
  @useResult
  $Res call(
      {String macAddress,
      String deviceName,
      int? batteryLevel,
      DateTime? connectedAt});
}

/// @nodoc
class _$ConnectedPenCopyWithImpl<$Res, $Val extends ConnectedPen>
    implements $ConnectedPenCopyWith<$Res> {
  _$ConnectedPenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectedPen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macAddress = null,
    Object? deviceName = null,
    Object? batteryLevel = freezed,
    Object? connectedAt = freezed,
  }) {
    return _then(_value.copyWith(
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      connectedAt: freezed == connectedAt
          ? _value.connectedAt
          : connectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectedPenImplCopyWith<$Res>
    implements $ConnectedPenCopyWith<$Res> {
  factory _$$ConnectedPenImplCopyWith(
          _$ConnectedPenImpl value, $Res Function(_$ConnectedPenImpl) then) =
      __$$ConnectedPenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String macAddress,
      String deviceName,
      int? batteryLevel,
      DateTime? connectedAt});
}

/// @nodoc
class __$$ConnectedPenImplCopyWithImpl<$Res>
    extends _$ConnectedPenCopyWithImpl<$Res, _$ConnectedPenImpl>
    implements _$$ConnectedPenImplCopyWith<$Res> {
  __$$ConnectedPenImplCopyWithImpl(
      _$ConnectedPenImpl _value, $Res Function(_$ConnectedPenImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectedPen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macAddress = null,
    Object? deviceName = null,
    Object? batteryLevel = freezed,
    Object? connectedAt = freezed,
  }) {
    return _then(_$ConnectedPenImpl(
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      connectedAt: freezed == connectedAt
          ? _value.connectedAt
          : connectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectedPenImpl implements _ConnectedPen {
  const _$ConnectedPenImpl(
      {required this.macAddress,
      required this.deviceName,
      this.batteryLevel,
      this.connectedAt});

  factory _$ConnectedPenImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectedPenImplFromJson(json);

  @override
  final String macAddress;
  @override
  final String deviceName;
  @override
  final int? batteryLevel;
  @override
  final DateTime? connectedAt;

  @override
  String toString() {
    return 'ConnectedPen(macAddress: $macAddress, deviceName: $deviceName, batteryLevel: $batteryLevel, connectedAt: $connectedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedPenImpl &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.connectedAt, connectedAt) ||
                other.connectedAt == connectedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, macAddress, deviceName, batteryLevel, connectedAt);

  /// Create a copy of ConnectedPen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedPenImplCopyWith<_$ConnectedPenImpl> get copyWith =>
      __$$ConnectedPenImplCopyWithImpl<_$ConnectedPenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectedPenImplToJson(
      this,
    );
  }
}

abstract class _ConnectedPen implements ConnectedPen {
  const factory _ConnectedPen(
      {required final String macAddress,
      required final String deviceName,
      final int? batteryLevel,
      final DateTime? connectedAt}) = _$ConnectedPenImpl;

  factory _ConnectedPen.fromJson(Map<String, dynamic> json) =
      _$ConnectedPenImpl.fromJson;

  @override
  String get macAddress;
  @override
  String get deviceName;
  @override
  int? get batteryLevel;
  @override
  DateTime? get connectedAt;

  /// Create a copy of ConnectedPen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectedPenImplCopyWith<_$ConnectedPenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
