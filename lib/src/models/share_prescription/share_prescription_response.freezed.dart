// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_prescription_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrescriptionModel _$PrescriptionModelFromJson(Map<String, dynamic> json) {
  return _PrescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PrescriptionData get data => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionModelCopyWith<PrescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionModelCopyWith<$Res> {
  factory $PrescriptionModelCopyWith(
          PrescriptionModel value, $Res Function(PrescriptionModel) then) =
      _$PrescriptionModelCopyWithImpl<$Res, PrescriptionModel>;
  @useResult
  $Res call({bool success, String message, PrescriptionData data});

  $PrescriptionDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PrescriptionModelCopyWithImpl<$Res, $Val extends PrescriptionModel>
    implements $PrescriptionModelCopyWith<$Res> {
  _$PrescriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PrescriptionData,
    ) as $Val);
  }

  /// Create a copy of PrescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrescriptionDataCopyWith<$Res> get data {
    return $PrescriptionDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrescriptionModelImplCopyWith<$Res>
    implements $PrescriptionModelCopyWith<$Res> {
  factory _$$PrescriptionModelImplCopyWith(_$PrescriptionModelImpl value,
          $Res Function(_$PrescriptionModelImpl) then) =
      __$$PrescriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, PrescriptionData data});

  @override
  $PrescriptionDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PrescriptionModelImplCopyWithImpl<$Res>
    extends _$PrescriptionModelCopyWithImpl<$Res, _$PrescriptionModelImpl>
    implements _$$PrescriptionModelImplCopyWith<$Res> {
  __$$PrescriptionModelImplCopyWithImpl(_$PrescriptionModelImpl _value,
      $Res Function(_$PrescriptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PrescriptionModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PrescriptionData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionModelImpl implements _PrescriptionModel {
  const _$PrescriptionModelImpl(
      {required this.success, required this.message, required this.data});

  factory _$PrescriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final PrescriptionData data;

  @override
  String toString() {
    return 'PrescriptionModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of PrescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionModelImplCopyWith<_$PrescriptionModelImpl> get copyWith =>
      __$$PrescriptionModelImplCopyWithImpl<_$PrescriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionModelImplToJson(
      this,
    );
  }
}

abstract class _PrescriptionModel implements PrescriptionModel {
  const factory _PrescriptionModel(
      {required final bool success,
      required final String message,
      required final PrescriptionData data}) = _$PrescriptionModelImpl;

  factory _PrescriptionModel.fromJson(Map<String, dynamic> json) =
      _$PrescriptionModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  PrescriptionData get data;

  /// Create a copy of PrescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionModelImplCopyWith<_$PrescriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionData _$PrescriptionDataFromJson(Map<String, dynamic> json) {
  return _PrescriptionData.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionData {
  String get jobId => throw _privateConstructorUsedError;
  int get queueLength => throw _privateConstructorUsedError;
  int get expectedTime => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionDataCopyWith<PrescriptionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionDataCopyWith<$Res> {
  factory $PrescriptionDataCopyWith(
          PrescriptionData value, $Res Function(PrescriptionData) then) =
      _$PrescriptionDataCopyWithImpl<$Res, PrescriptionData>;
  @useResult
  $Res call({String jobId, int queueLength, int expectedTime});
}

/// @nodoc
class _$PrescriptionDataCopyWithImpl<$Res, $Val extends PrescriptionData>
    implements $PrescriptionDataCopyWith<$Res> {
  _$PrescriptionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? queueLength = null,
    Object? expectedTime = null,
  }) {
    return _then(_value.copyWith(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      queueLength: null == queueLength
          ? _value.queueLength
          : queueLength // ignore: cast_nullable_to_non_nullable
              as int,
      expectedTime: null == expectedTime
          ? _value.expectedTime
          : expectedTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrescriptionDataImplCopyWith<$Res>
    implements $PrescriptionDataCopyWith<$Res> {
  factory _$$PrescriptionDataImplCopyWith(_$PrescriptionDataImpl value,
          $Res Function(_$PrescriptionDataImpl) then) =
      __$$PrescriptionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jobId, int queueLength, int expectedTime});
}

/// @nodoc
class __$$PrescriptionDataImplCopyWithImpl<$Res>
    extends _$PrescriptionDataCopyWithImpl<$Res, _$PrescriptionDataImpl>
    implements _$$PrescriptionDataImplCopyWith<$Res> {
  __$$PrescriptionDataImplCopyWithImpl(_$PrescriptionDataImpl _value,
      $Res Function(_$PrescriptionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrescriptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? queueLength = null,
    Object? expectedTime = null,
  }) {
    return _then(_$PrescriptionDataImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      queueLength: null == queueLength
          ? _value.queueLength
          : queueLength // ignore: cast_nullable_to_non_nullable
              as int,
      expectedTime: null == expectedTime
          ? _value.expectedTime
          : expectedTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionDataImpl implements _PrescriptionData {
  const _$PrescriptionDataImpl(
      {required this.jobId,
      required this.queueLength,
      required this.expectedTime});

  factory _$PrescriptionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionDataImplFromJson(json);

  @override
  final String jobId;
  @override
  final int queueLength;
  @override
  final int expectedTime;

  @override
  String toString() {
    return 'PrescriptionData(jobId: $jobId, queueLength: $queueLength, expectedTime: $expectedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionDataImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.queueLength, queueLength) ||
                other.queueLength == queueLength) &&
            (identical(other.expectedTime, expectedTime) ||
                other.expectedTime == expectedTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, jobId, queueLength, expectedTime);

  /// Create a copy of PrescriptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionDataImplCopyWith<_$PrescriptionDataImpl> get copyWith =>
      __$$PrescriptionDataImplCopyWithImpl<_$PrescriptionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionDataImplToJson(
      this,
    );
  }
}

abstract class _PrescriptionData implements PrescriptionData {
  const factory _PrescriptionData(
      {required final String jobId,
      required final int queueLength,
      required final int expectedTime}) = _$PrescriptionDataImpl;

  factory _PrescriptionData.fromJson(Map<String, dynamic> json) =
      _$PrescriptionDataImpl.fromJson;

  @override
  String get jobId;
  @override
  int get queueLength;
  @override
  int get expectedTime;

  /// Create a copy of PrescriptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionDataImplCopyWith<_$PrescriptionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
