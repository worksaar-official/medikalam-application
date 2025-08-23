// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientResponse _$PatientResponseFromJson(Map<String, dynamic> json) {
  return _PatientResponse.fromJson(json);
}

/// @nodoc
mixin _$PatientResponse {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  int get mobileNumber => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get age => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get hospitalId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get searchIndex => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;

  /// Serializes this PatientResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientResponseCopyWith<PatientResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientResponseCopyWith<$Res> {
  factory $PatientResponseCopyWith(
          PatientResponse value, $Res Function(PatientResponse) then) =
      _$PatientResponseCopyWithImpl<$Res, PatientResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      int mobileNumber,
      String fullName,
      String gender,
      int updatedAt,
      @JsonKey(defaultValue: 0) int age,
      int createdAt,
      String hospitalId,
      String creatorId,
      String searchIndex,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class _$PatientResponseCopyWithImpl<$Res, $Val extends PatientResponse>
    implements $PatientResponseCopyWith<$Res> {
  _$PatientResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mobileNumber = null,
    Object? fullName = null,
    Object? gender = null,
    Object? updatedAt = null,
    Object? age = null,
    Object? createdAt = null,
    Object? hospitalId = null,
    Object? creatorId = null,
    Object? searchIndex = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      searchIndex: null == searchIndex
          ? _value.searchIndex
          : searchIndex // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientResponseImplCopyWith<$Res>
    implements $PatientResponseCopyWith<$Res> {
  factory _$$PatientResponseImplCopyWith(_$PatientResponseImpl value,
          $Res Function(_$PatientResponseImpl) then) =
      __$$PatientResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      int mobileNumber,
      String fullName,
      String gender,
      int updatedAt,
      @JsonKey(defaultValue: 0) int age,
      int createdAt,
      String hospitalId,
      String creatorId,
      String searchIndex,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class __$$PatientResponseImplCopyWithImpl<$Res>
    extends _$PatientResponseCopyWithImpl<$Res, _$PatientResponseImpl>
    implements _$$PatientResponseImplCopyWith<$Res> {
  __$$PatientResponseImplCopyWithImpl(
      _$PatientResponseImpl _value, $Res Function(_$PatientResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mobileNumber = null,
    Object? fullName = null,
    Object? gender = null,
    Object? updatedAt = null,
    Object? age = null,
    Object? createdAt = null,
    Object? hospitalId = null,
    Object? creatorId = null,
    Object? searchIndex = null,
    Object? v = null,
  }) {
    return _then(_$PatientResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      searchIndex: null == searchIndex
          ? _value.searchIndex
          : searchIndex // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientResponseImpl implements _PatientResponse {
  const _$PatientResponseImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.mobileNumber,
      required this.fullName,
      required this.gender,
      required this.updatedAt,
      @JsonKey(defaultValue: 0) required this.age,
      required this.createdAt,
      required this.hospitalId,
      required this.creatorId,
      required this.searchIndex,
      @JsonKey(name: '__v') required this.v});

  factory _$PatientResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientResponseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final int mobileNumber;
  @override
  final String fullName;
  @override
  final String gender;
  @override
  final int updatedAt;
  @override
  @JsonKey(defaultValue: 0)
  final int age;
  @override
  final int createdAt;
  @override
  final String hospitalId;
  @override
  final String creatorId;
  @override
  final String searchIndex;
  @override
  @JsonKey(name: '__v')
  final int v;

  @override
  String toString() {
    return 'PatientResponse(id: $id, mobileNumber: $mobileNumber, fullName: $fullName, gender: $gender, updatedAt: $updatedAt, age: $age, createdAt: $createdAt, hospitalId: $hospitalId, creatorId: $creatorId, searchIndex: $searchIndex, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.searchIndex, searchIndex) ||
                other.searchIndex == searchIndex) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, mobileNumber, fullName,
      gender, updatedAt, age, createdAt, hospitalId, creatorId, searchIndex, v);

  /// Create a copy of PatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientResponseImplCopyWith<_$PatientResponseImpl> get copyWith =>
      __$$PatientResponseImplCopyWithImpl<_$PatientResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientResponseImplToJson(
      this,
    );
  }
}

abstract class _PatientResponse implements PatientResponse {
  const factory _PatientResponse(
      {@JsonKey(name: '_id') required final String id,
      required final int mobileNumber,
      required final String fullName,
      required final String gender,
      required final int updatedAt,
      @JsonKey(defaultValue: 0) required final int age,
      required final int createdAt,
      required final String hospitalId,
      required final String creatorId,
      required final String searchIndex,
      @JsonKey(name: '__v') required final int v}) = _$PatientResponseImpl;

  factory _PatientResponse.fromJson(Map<String, dynamic> json) =
      _$PatientResponseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  int get mobileNumber;
  @override
  String get fullName;
  @override
  String get gender;
  @override
  int get updatedAt;
  @override
  @JsonKey(defaultValue: 0)
  int get age;
  @override
  int get createdAt;
  @override
  String get hospitalId;
  @override
  String get creatorId;
  @override
  String get searchIndex;
  @override
  @JsonKey(name: '__v')
  int get v;

  /// Create a copy of PatientResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientResponseImplCopyWith<_$PatientResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
