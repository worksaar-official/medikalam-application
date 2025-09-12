// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_case_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViewCaseModel _$ViewCaseModelFromJson(Map<String, dynamic> json) {
  return _ViewCaseModel.fromJson(json);
}

/// @nodoc
mixin _$ViewCaseModel {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ViewCaseData? get data => throw _privateConstructorUsedError;

  /// Serializes this ViewCaseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViewCaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewCaseModelCopyWith<ViewCaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewCaseModelCopyWith<$Res> {
  factory $ViewCaseModelCopyWith(
          ViewCaseModel value, $Res Function(ViewCaseModel) then) =
      _$ViewCaseModelCopyWithImpl<$Res, ViewCaseModel>;
  @useResult
  $Res call({bool? success, String? message, ViewCaseData? data});

  $ViewCaseDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ViewCaseModelCopyWithImpl<$Res, $Val extends ViewCaseModel>
    implements $ViewCaseModelCopyWith<$Res> {
  _$ViewCaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewCaseModel
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
              as ViewCaseData?,
    ) as $Val);
  }

  /// Create a copy of ViewCaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewCaseDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ViewCaseDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewCaseModelImplCopyWith<$Res>
    implements $ViewCaseModelCopyWith<$Res> {
  factory _$$ViewCaseModelImplCopyWith(
          _$ViewCaseModelImpl value, $Res Function(_$ViewCaseModelImpl) then) =
      __$$ViewCaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, ViewCaseData? data});

  @override
  $ViewCaseDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ViewCaseModelImplCopyWithImpl<$Res>
    extends _$ViewCaseModelCopyWithImpl<$Res, _$ViewCaseModelImpl>
    implements _$$ViewCaseModelImplCopyWith<$Res> {
  __$$ViewCaseModelImplCopyWithImpl(
      _$ViewCaseModelImpl _value, $Res Function(_$ViewCaseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewCaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ViewCaseModelImpl(
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
              as ViewCaseData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewCaseModelImpl implements _ViewCaseModel {
  const _$ViewCaseModelImpl({this.success, this.message, this.data});

  factory _$ViewCaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewCaseModelImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final ViewCaseData? data;

  @override
  String toString() {
    return 'ViewCaseModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCaseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of ViewCaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCaseModelImplCopyWith<_$ViewCaseModelImpl> get copyWith =>
      __$$ViewCaseModelImplCopyWithImpl<_$ViewCaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewCaseModelImplToJson(
      this,
    );
  }
}

abstract class _ViewCaseModel implements ViewCaseModel {
  const factory _ViewCaseModel(
      {final bool? success,
      final String? message,
      final ViewCaseData? data}) = _$ViewCaseModelImpl;

  factory _ViewCaseModel.fromJson(Map<String, dynamic> json) =
      _$ViewCaseModelImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  ViewCaseData? get data;

  /// Create a copy of ViewCaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewCaseModelImplCopyWith<_$ViewCaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ViewCaseData _$ViewCaseDataFromJson(Map<String, dynamic> json) {
  return _ViewCaseData.fromJson(json);
}

/// @nodoc
mixin _$ViewCaseData {
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String get diagnosis => throw _privateConstructorUsedError;
  Patient get patient => throw _privateConstructorUsedError;
  List<Document> get documents => throw _privateConstructorUsedError;
  Doctor get doctor => throw _privateConstructorUsedError;
  List<int> get pageNumbers => throw _privateConstructorUsedError;
  bool get shareRequired => throw _privateConstructorUsedError;
  List<dynamic> get additionals => throw _privateConstructorUsedError;

  /// Serializes this ViewCaseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViewCaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewCaseDataCopyWith<ViewCaseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewCaseDataCopyWith<$Res> {
  factory $ViewCaseDataCopyWith(
          ViewCaseData value, $Res Function(ViewCaseData) then) =
      _$ViewCaseDataCopyWithImpl<$Res, ViewCaseData>;
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: '_id') String id,
      String updatedAt,
      String diagnosis,
      Patient patient,
      List<Document> documents,
      Doctor doctor,
      List<int> pageNumbers,
      bool shareRequired,
      List<dynamic> additionals});

  $PatientCopyWith<$Res> get patient;
  $DoctorCopyWith<$Res> get doctor;
}

/// @nodoc
class _$ViewCaseDataCopyWithImpl<$Res, $Val extends ViewCaseData>
    implements $ViewCaseDataCopyWith<$Res> {
  _$ViewCaseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViewCaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? updatedAt = null,
    Object? diagnosis = null,
    Object? patient = null,
    Object? documents = null,
    Object? doctor = null,
    Object? pageNumbers = null,
    Object? shareRequired = null,
    Object? additionals = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosis: null == diagnosis
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor,
      pageNumbers: null == pageNumbers
          ? _value.pageNumbers
          : pageNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      shareRequired: null == shareRequired
          ? _value.shareRequired
          : shareRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      additionals: null == additionals
          ? _value.additionals
          : additionals // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }

  /// Create a copy of ViewCaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res> get patient {
    return $PatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  /// Create a copy of ViewCaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorCopyWith<$Res> get doctor {
    return $DoctorCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewCaseDataImplCopyWith<$Res>
    implements $ViewCaseDataCopyWith<$Res> {
  factory _$$ViewCaseDataImplCopyWith(
          _$ViewCaseDataImpl value, $Res Function(_$ViewCaseDataImpl) then) =
      __$$ViewCaseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: '_id') String id,
      String updatedAt,
      String diagnosis,
      Patient patient,
      List<Document> documents,
      Doctor doctor,
      List<int> pageNumbers,
      bool shareRequired,
      List<dynamic> additionals});

  @override
  $PatientCopyWith<$Res> get patient;
  @override
  $DoctorCopyWith<$Res> get doctor;
}

/// @nodoc
class __$$ViewCaseDataImplCopyWithImpl<$Res>
    extends _$ViewCaseDataCopyWithImpl<$Res, _$ViewCaseDataImpl>
    implements _$$ViewCaseDataImplCopyWith<$Res> {
  __$$ViewCaseDataImplCopyWithImpl(
      _$ViewCaseDataImpl _value, $Res Function(_$ViewCaseDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViewCaseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? updatedAt = null,
    Object? diagnosis = null,
    Object? patient = null,
    Object? documents = null,
    Object? doctor = null,
    Object? pageNumbers = null,
    Object? shareRequired = null,
    Object? additionals = null,
  }) {
    return _then(_$ViewCaseDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosis: null == diagnosis
          ? _value.diagnosis
          : diagnosis // ignore: cast_nullable_to_non_nullable
              as String,
      patient: null == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as Patient,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor,
      pageNumbers: null == pageNumbers
          ? _value._pageNumbers
          : pageNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      shareRequired: null == shareRequired
          ? _value.shareRequired
          : shareRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      additionals: null == additionals
          ? _value._additionals
          : additionals // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViewCaseDataImpl implements _ViewCaseData {
  const _$ViewCaseDataImpl(
      {required this.title,
      @JsonKey(name: '_id') required this.id,
      required this.updatedAt,
      required this.diagnosis,
      required this.patient,
      required final List<Document> documents,
      required this.doctor,
      required final List<int> pageNumbers,
      required this.shareRequired,
      required final List<dynamic> additionals})
      : _documents = documents,
        _pageNumbers = pageNumbers,
        _additionals = additionals;

  factory _$ViewCaseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViewCaseDataImplFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String updatedAt;
  @override
  final String diagnosis;
  @override
  final Patient patient;
  final List<Document> _documents;
  @override
  List<Document> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  final Doctor doctor;
  final List<int> _pageNumbers;
  @override
  List<int> get pageNumbers {
    if (_pageNumbers is EqualUnmodifiableListView) return _pageNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pageNumbers);
  }

  @override
  final bool shareRequired;
  final List<dynamic> _additionals;
  @override
  List<dynamic> get additionals {
    if (_additionals is EqualUnmodifiableListView) return _additionals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionals);
  }

  @override
  String toString() {
    return 'ViewCaseData(title: $title, id: $id, updatedAt: $updatedAt, diagnosis: $diagnosis, patient: $patient, documents: $documents, doctor: $doctor, pageNumbers: $pageNumbers, shareRequired: $shareRequired, additionals: $additionals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCaseDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.diagnosis, diagnosis) ||
                other.diagnosis == diagnosis) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            const DeepCollectionEquality()
                .equals(other._pageNumbers, _pageNumbers) &&
            (identical(other.shareRequired, shareRequired) ||
                other.shareRequired == shareRequired) &&
            const DeepCollectionEquality()
                .equals(other._additionals, _additionals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      id,
      updatedAt,
      diagnosis,
      patient,
      const DeepCollectionEquality().hash(_documents),
      doctor,
      const DeepCollectionEquality().hash(_pageNumbers),
      shareRequired,
      const DeepCollectionEquality().hash(_additionals));

  /// Create a copy of ViewCaseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCaseDataImplCopyWith<_$ViewCaseDataImpl> get copyWith =>
      __$$ViewCaseDataImplCopyWithImpl<_$ViewCaseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViewCaseDataImplToJson(
      this,
    );
  }
}

abstract class _ViewCaseData implements ViewCaseData {
  const factory _ViewCaseData(
      {required final String title,
      @JsonKey(name: '_id') required final String id,
      required final String updatedAt,
      required final String diagnosis,
      required final Patient patient,
      required final List<Document> documents,
      required final Doctor doctor,
      required final List<int> pageNumbers,
      required final bool shareRequired,
      required final List<dynamic> additionals}) = _$ViewCaseDataImpl;

  factory _ViewCaseData.fromJson(Map<String, dynamic> json) =
      _$ViewCaseDataImpl.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get updatedAt;
  @override
  String get diagnosis;
  @override
  Patient get patient;
  @override
  List<Document> get documents;
  @override
  Doctor get doctor;
  @override
  List<int> get pageNumbers;
  @override
  bool get shareRequired;
  @override
  List<dynamic> get additionals;

  /// Create a copy of ViewCaseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewCaseDataImplCopyWith<_$ViewCaseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String? get name => throw _privateConstructorUsedError;
  int? get mobileNumber => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call({String? name, int? mobileNumber, String? gender});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? mobileNumber, String? gender});
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$PatientImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientImpl implements _Patient {
  const _$PatientImpl({this.name, this.mobileNumber, this.gender});

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final String? name;
  @override
  final int? mobileNumber;
  @override
  final String? gender;

  @override
  String toString() {
    return 'Patient(name: $name, mobileNumber: $mobileNumber, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mobileNumber, gender);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {final String? name,
      final int? mobileNumber,
      final String? gender}) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  String? get name;
  @override
  int? get mobileNumber;
  @override
  String? get gender;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this Document to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call({String title, String type, String? url});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentImplCopyWith(
          _$DocumentImpl value, $Res Function(_$DocumentImpl) then) =
      __$$DocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String type, String? url});
}

/// @nodoc
class __$$DocumentImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentImpl>
    implements _$$DocumentImplCopyWith<$Res> {
  __$$DocumentImplCopyWithImpl(
      _$DocumentImpl _value, $Res Function(_$DocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? url = freezed,
  }) {
    return _then(_$DocumentImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentImpl implements _Document {
  const _$DocumentImpl(
      {required this.title, required this.type, required this.url});

  factory _$DocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentImplFromJson(json);

  @override
  final String title;
  @override
  final String type;
  @override
  final String? url;

  @override
  String toString() {
    return 'Document(title: $title, type: $type, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, type, url);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      __$$DocumentImplCopyWithImpl<_$DocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentImplToJson(
      this,
    );
  }
}

abstract class _Document implements Document {
  const factory _Document(
      {required final String title,
      required final String type,
      required final String? url}) = _$DocumentImpl;

  factory _Document.fromJson(Map<String, dynamic> json) =
      _$DocumentImpl.fromJson;

  @override
  String get title;
  @override
  String get type;
  @override
  String? get url;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayPicture => throw _privateConstructorUsedError;
  Hospital get hospital => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String displayPicture,
      Hospital hospital,
      String title});

  $HospitalCopyWith<$Res> get hospital;
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayPicture = null,
    Object? hospital = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayPicture: null == displayPicture
          ? _value.displayPicture
          : displayPicture // ignore: cast_nullable_to_non_nullable
              as String,
      hospital: null == hospital
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as Hospital,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HospitalCopyWith<$Res> get hospital {
    return $HospitalCopyWith<$Res>(_value.hospital, (value) {
      return _then(_value.copyWith(hospital: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoctorImplCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$DoctorImplCopyWith(
          _$DoctorImpl value, $Res Function(_$DoctorImpl) then) =
      __$$DoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String displayPicture,
      Hospital hospital,
      String title});

  @override
  $HospitalCopyWith<$Res> get hospital;
}

/// @nodoc
class __$$DoctorImplCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$DoctorImpl>
    implements _$$DoctorImplCopyWith<$Res> {
  __$$DoctorImplCopyWithImpl(
      _$DoctorImpl _value, $Res Function(_$DoctorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayPicture = null,
    Object? hospital = null,
    Object? title = null,
  }) {
    return _then(_$DoctorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayPicture: null == displayPicture
          ? _value.displayPicture
          : displayPicture // ignore: cast_nullable_to_non_nullable
              as String,
      hospital: null == hospital
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as Hospital,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoctorImpl implements _Doctor {
  const _$DoctorImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.displayPicture,
      required this.hospital,
      required this.title});

  factory _$DoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String displayPicture;
  @override
  final Hospital hospital;
  @override
  final String title;

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name, displayPicture: $displayPicture, hospital: $hospital, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayPicture, displayPicture) ||
                other.displayPicture == displayPicture) &&
            (identical(other.hospital, hospital) ||
                other.hospital == hospital) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, displayPicture, hospital, title);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      __$$DoctorImplCopyWithImpl<_$DoctorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorImplToJson(
      this,
    );
  }
}

abstract class _Doctor implements Doctor {
  const factory _Doctor(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String displayPicture,
      required final Hospital hospital,
      required final String title}) = _$DoctorImpl;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$DoctorImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get displayPicture;
  @override
  Hospital get hospital;
  @override
  String get title;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return _Hospital.fromJson(json);
}

/// @nodoc
mixin _$Hospital {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Hospital to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HospitalCopyWith<Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res, Hospital>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name});
}

/// @nodoc
class _$HospitalCopyWithImpl<$Res, $Val extends Hospital>
    implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HospitalImplCopyWith<$Res>
    implements $HospitalCopyWith<$Res> {
  factory _$$HospitalImplCopyWith(
          _$HospitalImpl value, $Res Function(_$HospitalImpl) then) =
      __$$HospitalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String name});
}

/// @nodoc
class __$$HospitalImplCopyWithImpl<$Res>
    extends _$HospitalCopyWithImpl<$Res, _$HospitalImpl>
    implements _$$HospitalImplCopyWith<$Res> {
  __$$HospitalImplCopyWithImpl(
      _$HospitalImpl _value, $Res Function(_$HospitalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$HospitalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HospitalImpl implements _Hospital {
  const _$HospitalImpl(
      {@JsonKey(name: '_id') required this.id, required this.name});

  factory _$HospitalImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'Hospital(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      __$$HospitalImplCopyWithImpl<_$HospitalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalImplToJson(
      this,
    );
  }
}

abstract class _Hospital implements Hospital {
  const factory _Hospital(
      {@JsonKey(name: '_id') required final String id,
      required final String name}) = _$HospitalImpl;

  factory _Hospital.fromJson(Map<String, dynamic> json) =
      _$HospitalImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
