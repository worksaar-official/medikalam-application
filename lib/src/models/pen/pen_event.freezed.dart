// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PenEvent _$PenEventFromJson(Map<String, dynamic> json) {
  return _PenEvent.fromJson(json);
}

/// @nodoc
mixin _$PenEvent {
  @JsonKey(name: 'STRING_PEN_MAC_ADDRESS')
  String get macAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'STRING_DEVICE_NAME')
  String get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'STRING_DEVICE_RSSI')
  int get rssi => throw _privateConstructorUsedError;
  @JsonKey(name: 'STRING_DEVICE_ADVDATA')
  dynamic get advData => throw _privateConstructorUsedError;
  int get penMsgType => throw _privateConstructorUsedError;

  /// Serializes this PenEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PenEventCopyWith<PenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PenEventCopyWith<$Res> {
  factory $PenEventCopyWith(PenEvent value, $Res Function(PenEvent) then) =
      _$PenEventCopyWithImpl<$Res, PenEvent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'STRING_PEN_MAC_ADDRESS') String macAddress,
      @JsonKey(name: 'STRING_DEVICE_NAME') String deviceName,
      @JsonKey(name: 'STRING_DEVICE_RSSI') int rssi,
      @JsonKey(name: 'STRING_DEVICE_ADVDATA') dynamic advData,
      int penMsgType});
}

/// @nodoc
class _$PenEventCopyWithImpl<$Res, $Val extends PenEvent>
    implements $PenEventCopyWith<$Res> {
  _$PenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macAddress = null,
    Object? deviceName = null,
    Object? rssi = null,
    Object? advData = freezed,
    Object? penMsgType = null,
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
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      advData: freezed == advData
          ? _value.advData
          : advData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      penMsgType: null == penMsgType
          ? _value.penMsgType
          : penMsgType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PenEventImplCopyWith<$Res>
    implements $PenEventCopyWith<$Res> {
  factory _$$PenEventImplCopyWith(
          _$PenEventImpl value, $Res Function(_$PenEventImpl) then) =
      __$$PenEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'STRING_PEN_MAC_ADDRESS') String macAddress,
      @JsonKey(name: 'STRING_DEVICE_NAME') String deviceName,
      @JsonKey(name: 'STRING_DEVICE_RSSI') int rssi,
      @JsonKey(name: 'STRING_DEVICE_ADVDATA') dynamic advData,
      int penMsgType});
}

/// @nodoc
class __$$PenEventImplCopyWithImpl<$Res>
    extends _$PenEventCopyWithImpl<$Res, _$PenEventImpl>
    implements _$$PenEventImplCopyWith<$Res> {
  __$$PenEventImplCopyWithImpl(
      _$PenEventImpl _value, $Res Function(_$PenEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macAddress = null,
    Object? deviceName = null,
    Object? rssi = null,
    Object? advData = freezed,
    Object? penMsgType = null,
  }) {
    return _then(_$PenEventImpl(
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
      advData: freezed == advData
          ? _value.advData
          : advData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      penMsgType: null == penMsgType
          ? _value.penMsgType
          : penMsgType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PenEventImpl implements _PenEvent {
  const _$PenEventImpl(
      {@JsonKey(name: 'STRING_PEN_MAC_ADDRESS') required this.macAddress,
      @JsonKey(name: 'STRING_DEVICE_NAME') required this.deviceName,
      @JsonKey(name: 'STRING_DEVICE_RSSI') required this.rssi,
      @JsonKey(name: 'STRING_DEVICE_ADVDATA') this.advData,
      required this.penMsgType});

  factory _$PenEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$PenEventImplFromJson(json);

  @override
  @JsonKey(name: 'STRING_PEN_MAC_ADDRESS')
  final String macAddress;
  @override
  @JsonKey(name: 'STRING_DEVICE_NAME')
  final String deviceName;
  @override
  @JsonKey(name: 'STRING_DEVICE_RSSI')
  final int rssi;
  @override
  @JsonKey(name: 'STRING_DEVICE_ADVDATA')
  final dynamic advData;
  @override
  final int penMsgType;

  @override
  String toString() {
    return 'PenEvent(macAddress: $macAddress, deviceName: $deviceName, rssi: $rssi, advData: $advData, penMsgType: $penMsgType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PenEventImpl &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            const DeepCollectionEquality().equals(other.advData, advData) &&
            (identical(other.penMsgType, penMsgType) ||
                other.penMsgType == penMsgType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, macAddress, deviceName, rssi,
      const DeepCollectionEquality().hash(advData), penMsgType);

  /// Create a copy of PenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PenEventImplCopyWith<_$PenEventImpl> get copyWith =>
      __$$PenEventImplCopyWithImpl<_$PenEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PenEventImplToJson(
      this,
    );
  }
}

abstract class _PenEvent implements PenEvent {
  const factory _PenEvent(
      {@JsonKey(name: 'STRING_PEN_MAC_ADDRESS')
      required final String macAddress,
      @JsonKey(name: 'STRING_DEVICE_NAME') required final String deviceName,
      @JsonKey(name: 'STRING_DEVICE_RSSI') required final int rssi,
      @JsonKey(name: 'STRING_DEVICE_ADVDATA') final dynamic advData,
      required final int penMsgType}) = _$PenEventImpl;

  factory _PenEvent.fromJson(Map<String, dynamic> json) =
      _$PenEventImpl.fromJson;

  @override
  @JsonKey(name: 'STRING_PEN_MAC_ADDRESS')
  String get macAddress;
  @override
  @JsonKey(name: 'STRING_DEVICE_NAME')
  String get deviceName;
  @override
  @JsonKey(name: 'STRING_DEVICE_RSSI')
  int get rssi;
  @override
  @JsonKey(name: 'STRING_DEVICE_ADVDATA')
  dynamic get advData;
  @override
  int get penMsgType;

  /// Create a copy of PenEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PenEventImplCopyWith<_$PenEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
