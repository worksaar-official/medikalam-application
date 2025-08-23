// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) {
  return _AppointmentResponse.fromJson(json);
}

/// @nodoc
mixin _$AppointmentResponse {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_id')
  String get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'appt_date')
  DateTime get apptDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'appt_time')
  String get apptTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'editor_id')
  String? get editorId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppointmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentResponseCopyWith<AppointmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentResponseCopyWith<$Res> {
  factory $AppointmentResponseCopyWith(
          AppointmentResponse value, $Res Function(AppointmentResponse) then) =
      _$AppointmentResponseCopyWithImpl<$Res, AppointmentResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'patient_id') String patientId,
      @JsonKey(name: 'fullName') String name,
      @JsonKey(name: 'appt_date') DateTime apptDate,
      @JsonKey(name: 'appt_time') String apptTime,
      @JsonKey(name: 'editor_id') String? editorId,
      DateTime createdAt});
}

/// @nodoc
class _$AppointmentResponseCopyWithImpl<$Res, $Val extends AppointmentResponse>
    implements $AppointmentResponseCopyWith<$Res> {
  _$AppointmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? name = null,
    Object? apptDate = null,
    Object? apptTime = null,
    Object? editorId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apptDate: null == apptDate
          ? _value.apptDate
          : apptDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      apptTime: null == apptTime
          ? _value.apptTime
          : apptTime // ignore: cast_nullable_to_non_nullable
              as String,
      editorId: freezed == editorId
          ? _value.editorId
          : editorId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentResponseImplCopyWith<$Res>
    implements $AppointmentResponseCopyWith<$Res> {
  factory _$$AppointmentResponseImplCopyWith(_$AppointmentResponseImpl value,
          $Res Function(_$AppointmentResponseImpl) then) =
      __$$AppointmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'patient_id') String patientId,
      @JsonKey(name: 'fullName') String name,
      @JsonKey(name: 'appt_date') DateTime apptDate,
      @JsonKey(name: 'appt_time') String apptTime,
      @JsonKey(name: 'editor_id') String? editorId,
      DateTime createdAt});
}

/// @nodoc
class __$$AppointmentResponseImplCopyWithImpl<$Res>
    extends _$AppointmentResponseCopyWithImpl<$Res, _$AppointmentResponseImpl>
    implements _$$AppointmentResponseImplCopyWith<$Res> {
  __$$AppointmentResponseImplCopyWithImpl(_$AppointmentResponseImpl _value,
      $Res Function(_$AppointmentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? name = null,
    Object? apptDate = null,
    Object? apptTime = null,
    Object? editorId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$AppointmentResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      apptDate: null == apptDate
          ? _value.apptDate
          : apptDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      apptTime: null == apptTime
          ? _value.apptTime
          : apptTime // ignore: cast_nullable_to_non_nullable
              as String,
      editorId: freezed == editorId
          ? _value.editorId
          : editorId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentResponseImpl implements _AppointmentResponse {
  const _$AppointmentResponseImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'patient_id') required this.patientId,
      @JsonKey(name: 'fullName') required this.name,
      @JsonKey(name: 'appt_date') required this.apptDate,
      @JsonKey(name: 'appt_time') required this.apptTime,
      @JsonKey(name: 'editor_id') this.editorId,
      required this.createdAt});

  factory _$AppointmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'patient_id')
  final String patientId;
  @override
  @JsonKey(name: 'fullName')
  final String name;
  @override
  @JsonKey(name: 'appt_date')
  final DateTime apptDate;
  @override
  @JsonKey(name: 'appt_time')
  final String apptTime;
  @override
  @JsonKey(name: 'editor_id')
  final String? editorId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AppointmentResponse(id: $id, patientId: $patientId, name: $name, apptDate: $apptDate, apptTime: $apptTime, editorId: $editorId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.apptDate, apptDate) ||
                other.apptDate == apptDate) &&
            (identical(other.apptTime, apptTime) ||
                other.apptTime == apptTime) &&
            (identical(other.editorId, editorId) ||
                other.editorId == editorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, patientId, name, apptDate,
      apptTime, editorId, createdAt);

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentResponseImplCopyWith<_$AppointmentResponseImpl> get copyWith =>
      __$$AppointmentResponseImplCopyWithImpl<_$AppointmentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentResponseImplToJson(
      this,
    );
  }
}

abstract class _AppointmentResponse implements AppointmentResponse {
  const factory _AppointmentResponse(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'patient_id') required final String patientId,
      @JsonKey(name: 'fullName') required final String name,
      @JsonKey(name: 'appt_date') required final DateTime apptDate,
      @JsonKey(name: 'appt_time') required final String apptTime,
      @JsonKey(name: 'editor_id') final String? editorId,
      required final DateTime createdAt}) = _$AppointmentResponseImpl;

  factory _AppointmentResponse.fromJson(Map<String, dynamic> json) =
      _$AppointmentResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'patient_id')
  String get patientId;
  @override
  @JsonKey(name: 'fullName')
  String get name;
  @override
  @JsonKey(name: 'appt_date')
  DateTime get apptDate;
  @override
  @JsonKey(name: 'appt_time')
  String get apptTime;
  @override
  @JsonKey(name: 'editor_id')
  String? get editorId;
  @override
  DateTime get createdAt;

  /// Create a copy of AppointmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentResponseImplCopyWith<_$AppointmentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
