// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatientDetails _$PatientDetailsFromJson(Map<String, dynamic> json) {
  return _PatientDetails.fromJson(json);
}

/// @nodoc
mixin _$PatientDetails {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  /// Serializes this PatientDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientDetailsCopyWith<PatientDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDetailsCopyWith<$Res> {
  factory $PatientDetailsCopyWith(
          PatientDetails value, $Res Function(PatientDetails) then) =
      _$PatientDetailsCopyWithImpl<$Res, PatientDetails>;
  @useResult
  $Res call({bool success, String message, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$PatientDetailsCopyWithImpl<$Res, $Val extends PatientDetails>
    implements $PatientDetailsCopyWith<$Res> {
  _$PatientDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientDetails
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
              as Data,
    ) as $Val);
  }

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientDetailsImplCopyWith<$Res>
    implements $PatientDetailsCopyWith<$Res> {
  factory _$$PatientDetailsImplCopyWith(_$PatientDetailsImpl value,
          $Res Function(_$PatientDetailsImpl) then) =
      __$$PatientDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PatientDetailsImplCopyWithImpl<$Res>
    extends _$PatientDetailsCopyWithImpl<$Res, _$PatientDetailsImpl>
    implements _$$PatientDetailsImplCopyWith<$Res> {
  __$$PatientDetailsImplCopyWithImpl(
      _$PatientDetailsImpl _value, $Res Function(_$PatientDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PatientDetailsImpl(
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
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientDetailsImpl implements _PatientDetails {
  const _$PatientDetailsImpl(
      {required this.success, required this.message, required this.data});

  factory _$PatientDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientDetailsImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final Data data;

  @override
  String toString() {
    return 'PatientDetails(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientDetailsImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDetailsImplCopyWith<_$PatientDetailsImpl> get copyWith =>
      __$$PatientDetailsImplCopyWithImpl<_$PatientDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientDetailsImplToJson(
      this,
    );
  }
}

abstract class _PatientDetails implements PatientDetails {
  const factory _PatientDetails(
      {required final bool success,
      required final String message,
      required final Data data}) = _$PatientDetailsImpl;

  factory _PatientDetails.fromJson(Map<String, dynamic> json) =
      _$PatientDetailsImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Data get data;

  /// Create a copy of PatientDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDetailsImplCopyWith<_$PatientDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  PatientInfo get patientDetails => throw _privateConstructorUsedError;
  List<PatientCase> get patientCases => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({PatientInfo patientDetails, List<PatientCase> patientCases});

  $PatientInfoCopyWith<$Res> get patientDetails;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientDetails = null,
    Object? patientCases = null,
  }) {
    return _then(_value.copyWith(
      patientDetails: null == patientDetails
          ? _value.patientDetails
          : patientDetails // ignore: cast_nullable_to_non_nullable
              as PatientInfo,
      patientCases: null == patientCases
          ? _value.patientCases
          : patientCases // ignore: cast_nullable_to_non_nullable
              as List<PatientCase>,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientInfoCopyWith<$Res> get patientDetails {
    return $PatientInfoCopyWith<$Res>(_value.patientDetails, (value) {
      return _then(_value.copyWith(patientDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PatientInfo patientDetails, List<PatientCase> patientCases});

  @override
  $PatientInfoCopyWith<$Res> get patientDetails;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientDetails = null,
    Object? patientCases = null,
  }) {
    return _then(_$DataImpl(
      patientDetails: null == patientDetails
          ? _value.patientDetails
          : patientDetails // ignore: cast_nullable_to_non_nullable
              as PatientInfo,
      patientCases: null == patientCases
          ? _value._patientCases
          : patientCases // ignore: cast_nullable_to_non_nullable
              as List<PatientCase>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {required this.patientDetails,
      required final List<PatientCase> patientCases})
      : _patientCases = patientCases;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final PatientInfo patientDetails;
  final List<PatientCase> _patientCases;
  @override
  List<PatientCase> get patientCases {
    if (_patientCases is EqualUnmodifiableListView) return _patientCases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patientCases);
  }

  @override
  String toString() {
    return 'Data(patientDetails: $patientDetails, patientCases: $patientCases)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.patientDetails, patientDetails) ||
                other.patientDetails == patientDetails) &&
            const DeepCollectionEquality()
                .equals(other._patientCases, _patientCases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, patientDetails,
      const DeepCollectionEquality().hash(_patientCases));

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {required final PatientInfo patientDetails,
      required final List<PatientCase> patientCases}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  PatientInfo get patientDetails;
  @override
  List<PatientCase> get patientCases;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientInfo _$PatientInfoFromJson(Map<String, dynamic> json) {
  return _PatientInfo.fromJson(json);
}

/// @nodoc
mixin _$PatientInfo {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  int get mobileNumber => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  /// Serializes this PatientInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientInfoCopyWith<PatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientInfoCopyWith<$Res> {
  factory $PatientInfoCopyWith(
          PatientInfo value, $Res Function(PatientInfo) then) =
      _$PatientInfoCopyWithImpl<$Res, PatientInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      int mobileNumber,
      String fullName,
      String gender,
      int age});
}

/// @nodoc
class _$PatientInfoCopyWithImpl<$Res, $Val extends PatientInfo>
    implements $PatientInfoCopyWith<$Res> {
  _$PatientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mobileNumber = null,
    Object? fullName = null,
    Object? gender = null,
    Object? age = null,
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
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientInfoImplCopyWith<$Res>
    implements $PatientInfoCopyWith<$Res> {
  factory _$$PatientInfoImplCopyWith(
          _$PatientInfoImpl value, $Res Function(_$PatientInfoImpl) then) =
      __$$PatientInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      int mobileNumber,
      String fullName,
      String gender,
      int age});
}

/// @nodoc
class __$$PatientInfoImplCopyWithImpl<$Res>
    extends _$PatientInfoCopyWithImpl<$Res, _$PatientInfoImpl>
    implements _$$PatientInfoImplCopyWith<$Res> {
  __$$PatientInfoImplCopyWithImpl(
      _$PatientInfoImpl _value, $Res Function(_$PatientInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mobileNumber = null,
    Object? fullName = null,
    Object? gender = null,
    Object? age = null,
  }) {
    return _then(_$PatientInfoImpl(
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
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientInfoImpl implements _PatientInfo {
  const _$PatientInfoImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.mobileNumber,
      required this.fullName,
      required this.gender,
      required this.age});

  factory _$PatientInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientInfoImplFromJson(json);

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
  final int age;

  @override
  String toString() {
    return 'PatientInfo(id: $id, mobileNumber: $mobileNumber, fullName: $fullName, gender: $gender, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mobileNumber, fullName, gender, age);

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientInfoImplCopyWith<_$PatientInfoImpl> get copyWith =>
      __$$PatientInfoImplCopyWithImpl<_$PatientInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientInfoImplToJson(
      this,
    );
  }
}

abstract class _PatientInfo implements PatientInfo {
  const factory _PatientInfo(
      {@JsonKey(name: '_id') required final String id,
      required final int mobileNumber,
      required final String fullName,
      required final String gender,
      required final int age}) = _$PatientInfoImpl;

  factory _PatientInfo.fromJson(Map<String, dynamic> json) =
      _$PatientInfoImpl.fromJson;

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
  int get age;

  /// Create a copy of PatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientInfoImplCopyWith<_$PatientInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientCase _$PatientCaseFromJson(Map<String, dynamic> json) {
  return _PatientCase.fromJson(json);
}

/// @nodoc
mixin _$PatientCase {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get hospitalPatientId => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  String get hospitalId => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  List<int> get pageNumbers => throw _privateConstructorUsedError;
  List<Additional> get additionals => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;

  /// Serializes this PatientCase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientCase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCaseCopyWith<PatientCase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCaseCopyWith<$Res> {
  factory $PatientCaseCopyWith(
          PatientCase value, $Res Function(PatientCase) then) =
      _$PatientCaseCopyWithImpl<$Res, PatientCase>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String hospitalPatientId,
      bool isOpen,
      int updatedAt,
      String hospitalId,
      String doctorId,
      String creatorId,
      int pageCount,
      int createdAt,
      List<int> pageNumbers,
      List<Additional> additionals,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class _$PatientCaseCopyWithImpl<$Res, $Val extends PatientCase>
    implements $PatientCaseCopyWith<$Res> {
  _$PatientCaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientCase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hospitalPatientId = null,
    Object? isOpen = null,
    Object? updatedAt = null,
    Object? hospitalId = null,
    Object? doctorId = null,
    Object? creatorId = null,
    Object? pageCount = null,
    Object? createdAt = null,
    Object? pageNumbers = null,
    Object? additionals = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalPatientId: null == hospitalPatientId
          ? _value.hospitalPatientId
          : hospitalPatientId // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumbers: null == pageNumbers
          ? _value.pageNumbers
          : pageNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      additionals: null == additionals
          ? _value.additionals
          : additionals // ignore: cast_nullable_to_non_nullable
              as List<Additional>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientCaseImplCopyWith<$Res>
    implements $PatientCaseCopyWith<$Res> {
  factory _$$PatientCaseImplCopyWith(
          _$PatientCaseImpl value, $Res Function(_$PatientCaseImpl) then) =
      __$$PatientCaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String hospitalPatientId,
      bool isOpen,
      int updatedAt,
      String hospitalId,
      String doctorId,
      String creatorId,
      int pageCount,
      int createdAt,
      List<int> pageNumbers,
      List<Additional> additionals,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class __$$PatientCaseImplCopyWithImpl<$Res>
    extends _$PatientCaseCopyWithImpl<$Res, _$PatientCaseImpl>
    implements _$$PatientCaseImplCopyWith<$Res> {
  __$$PatientCaseImplCopyWithImpl(
      _$PatientCaseImpl _value, $Res Function(_$PatientCaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientCase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hospitalPatientId = null,
    Object? isOpen = null,
    Object? updatedAt = null,
    Object? hospitalId = null,
    Object? doctorId = null,
    Object? creatorId = null,
    Object? pageCount = null,
    Object? createdAt = null,
    Object? pageNumbers = null,
    Object? additionals = null,
    Object? v = null,
  }) {
    return _then(_$PatientCaseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalPatientId: null == hospitalPatientId
          ? _value.hospitalPatientId
          : hospitalPatientId // ignore: cast_nullable_to_non_nullable
              as String,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumbers: null == pageNumbers
          ? _value._pageNumbers
          : pageNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      additionals: null == additionals
          ? _value._additionals
          : additionals // ignore: cast_nullable_to_non_nullable
              as List<Additional>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientCaseImpl implements _PatientCase {
  const _$PatientCaseImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.hospitalPatientId,
      this.isOpen = false,
      required this.updatedAt,
      required this.hospitalId,
      required this.doctorId,
      required this.creatorId,
      required this.pageCount,
      required this.createdAt,
      required final List<int> pageNumbers,
      required final List<Additional> additionals,
      @JsonKey(name: '__v') required this.v})
      : _pageNumbers = pageNumbers,
        _additionals = additionals;

  factory _$PatientCaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientCaseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String hospitalPatientId;
  @override
  @JsonKey()
  final bool isOpen;
  @override
  final int updatedAt;
  @override
  final String hospitalId;
  @override
  final String doctorId;
  @override
  final String creatorId;
  @override
  final int pageCount;
  @override
  final int createdAt;
  final List<int> _pageNumbers;
  @override
  List<int> get pageNumbers {
    if (_pageNumbers is EqualUnmodifiableListView) return _pageNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageNumbers);
  }

  final List<Additional> _additionals;
  @override
  List<Additional> get additionals {
    if (_additionals is EqualUnmodifiableListView) return _additionals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionals);
  }

  @override
  @JsonKey(name: '__v')
  final int v;

  @override
  String toString() {
    return 'PatientCase(id: $id, hospitalPatientId: $hospitalPatientId, isOpen: $isOpen, updatedAt: $updatedAt, hospitalId: $hospitalId, doctorId: $doctorId, creatorId: $creatorId, pageCount: $pageCount, createdAt: $createdAt, pageNumbers: $pageNumbers, additionals: $additionals, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientCaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hospitalPatientId, hospitalPatientId) ||
                other.hospitalPatientId == hospitalPatientId) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._pageNumbers, _pageNumbers) &&
            const DeepCollectionEquality()
                .equals(other._additionals, _additionals) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hospitalPatientId,
      isOpen,
      updatedAt,
      hospitalId,
      doctorId,
      creatorId,
      pageCount,
      createdAt,
      const DeepCollectionEquality().hash(_pageNumbers),
      const DeepCollectionEquality().hash(_additionals),
      v);

  /// Create a copy of PatientCase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientCaseImplCopyWith<_$PatientCaseImpl> get copyWith =>
      __$$PatientCaseImplCopyWithImpl<_$PatientCaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientCaseImplToJson(
      this,
    );
  }
}

abstract class _PatientCase implements PatientCase {
  const factory _PatientCase(
      {@JsonKey(name: '_id') required final String id,
      required final String hospitalPatientId,
      final bool isOpen,
      required final int updatedAt,
      required final String hospitalId,
      required final String doctorId,
      required final String creatorId,
      required final int pageCount,
      required final int createdAt,
      required final List<int> pageNumbers,
      required final List<Additional> additionals,
      @JsonKey(name: '__v') required final int v}) = _$PatientCaseImpl;

  factory _PatientCase.fromJson(Map<String, dynamic> json) =
      _$PatientCaseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get hospitalPatientId;
  @override
  bool get isOpen;
  @override
  int get updatedAt;
  @override
  String get hospitalId;
  @override
  String get doctorId;
  @override
  String get creatorId;
  @override
  int get pageCount;
  @override
  int get createdAt;
  @override
  List<int> get pageNumbers;
  @override
  List<Additional> get additionals;
  @override
  @JsonKey(name: '__v')
  int get v;

  /// Create a copy of PatientCase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientCaseImplCopyWith<_$PatientCaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Additional _$AdditionalFromJson(Map<String, dynamic> json) {
  return _Additional.fromJson(json);
}

/// @nodoc
mixin _$Additional {
  @JsonKey(name: 'public_url')
  String get publicUrl => throw _privateConstructorUsedError;
  Details get details => throw _privateConstructorUsedError;

  /// Serializes this Additional to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Additional
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdditionalCopyWith<Additional> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalCopyWith<$Res> {
  factory $AdditionalCopyWith(
          Additional value, $Res Function(Additional) then) =
      _$AdditionalCopyWithImpl<$Res, Additional>;
  @useResult
  $Res call({@JsonKey(name: 'public_url') String publicUrl, Details details});

  $DetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$AdditionalCopyWithImpl<$Res, $Val extends Additional>
    implements $AdditionalCopyWith<$Res> {
  _$AdditionalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Additional
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicUrl = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details,
    ) as $Val);
  }

  /// Create a copy of Additional
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailsCopyWith<$Res> get details {
    return $DetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdditionalImplCopyWith<$Res>
    implements $AdditionalCopyWith<$Res> {
  factory _$$AdditionalImplCopyWith(
          _$AdditionalImpl value, $Res Function(_$AdditionalImpl) then) =
      __$$AdditionalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'public_url') String publicUrl, Details details});

  @override
  $DetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$AdditionalImplCopyWithImpl<$Res>
    extends _$AdditionalCopyWithImpl<$Res, _$AdditionalImpl>
    implements _$$AdditionalImplCopyWith<$Res> {
  __$$AdditionalImplCopyWithImpl(
      _$AdditionalImpl _value, $Res Function(_$AdditionalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Additional
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicUrl = null,
    Object? details = null,
  }) {
    return _then(_$AdditionalImpl(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdditionalImpl implements _Additional {
  const _$AdditionalImpl(
      {@JsonKey(name: 'public_url') required this.publicUrl,
      required this.details});

  factory _$AdditionalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionalImplFromJson(json);

  @override
  @JsonKey(name: 'public_url')
  final String publicUrl;
  @override
  final Details details;

  @override
  String toString() {
    return 'Additional(publicUrl: $publicUrl, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalImpl &&
            (identical(other.publicUrl, publicUrl) ||
                other.publicUrl == publicUrl) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publicUrl, details);

  /// Create a copy of Additional
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionalImplCopyWith<_$AdditionalImpl> get copyWith =>
      __$$AdditionalImplCopyWithImpl<_$AdditionalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdditionalImplToJson(
      this,
    );
  }
}

abstract class _Additional implements Additional {
  const factory _Additional(
      {@JsonKey(name: 'public_url') required final String publicUrl,
      required final Details details}) = _$AdditionalImpl;

  factory _Additional.fromJson(Map<String, dynamic> json) =
      _$AdditionalImpl.fromJson;

  @override
  @JsonKey(name: 'public_url')
  String get publicUrl;
  @override
  Details get details;

  /// Create a copy of Additional
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdditionalImplCopyWith<_$AdditionalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return _Details.fromJson(json);
}

/// @nodoc
mixin _$Details {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Details to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Details
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailsCopyWith<Details> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsCopyWith<$Res> {
  factory $DetailsCopyWith(Details value, $Res Function(Details) then) =
      _$DetailsCopyWithImpl<$Res, Details>;
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class _$DetailsCopyWithImpl<$Res, $Val extends Details>
    implements $DetailsCopyWith<$Res> {
  _$DetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Details
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailsImplCopyWith<$Res> implements $DetailsCopyWith<$Res> {
  factory _$$DetailsImplCopyWith(
          _$DetailsImpl value, $Res Function(_$DetailsImpl) then) =
      __$$DetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class __$$DetailsImplCopyWithImpl<$Res>
    extends _$DetailsCopyWithImpl<$Res, _$DetailsImpl>
    implements _$$DetailsImplCopyWith<$Res> {
  __$$DetailsImplCopyWithImpl(
      _$DetailsImpl _value, $Res Function(_$DetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Details
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$DetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailsImpl implements _Details {
  const _$DetailsImpl({required this.name, required this.description});

  factory _$DetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailsImplFromJson(json);

  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'Details(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of Details
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsImplCopyWith<_$DetailsImpl> get copyWith =>
      __$$DetailsImplCopyWithImpl<_$DetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailsImplToJson(
      this,
    );
  }
}

abstract class _Details implements Details {
  const factory _Details(
      {required final String name,
      required final String description}) = _$DetailsImpl;

  factory _Details.fromJson(Map<String, dynamic> json) = _$DetailsImpl.fromJson;

  @override
  String get name;
  @override
  String get description;

  /// Create a copy of Details
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailsImplCopyWith<_$DetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
