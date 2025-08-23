// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guide_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GuideLinkModel _$GuideLinkModelFromJson(Map<String, dynamic> json) {
  return _GuideLinkModel.fromJson(json);
}

/// @nodoc
mixin _$GuideLinkModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  /// Serializes this GuideLinkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuideLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuideLinkModelCopyWith<GuideLinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuideLinkModelCopyWith<$Res> {
  factory $GuideLinkModelCopyWith(
          GuideLinkModel value, $Res Function(GuideLinkModel) then) =
      _$GuideLinkModelCopyWithImpl<$Res, GuideLinkModel>;
  @useResult
  $Res call({bool success, String message, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$GuideLinkModelCopyWithImpl<$Res, $Val extends GuideLinkModel>
    implements $GuideLinkModelCopyWith<$Res> {
  _$GuideLinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuideLinkModel
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

  /// Create a copy of GuideLinkModel
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
abstract class _$$GuideLinkModelImplCopyWith<$Res>
    implements $GuideLinkModelCopyWith<$Res> {
  factory _$$GuideLinkModelImplCopyWith(_$GuideLinkModelImpl value,
          $Res Function(_$GuideLinkModelImpl) then) =
      __$$GuideLinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GuideLinkModelImplCopyWithImpl<$Res>
    extends _$GuideLinkModelCopyWithImpl<$Res, _$GuideLinkModelImpl>
    implements _$$GuideLinkModelImplCopyWith<$Res> {
  __$$GuideLinkModelImplCopyWithImpl(
      _$GuideLinkModelImpl _value, $Res Function(_$GuideLinkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuideLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$GuideLinkModelImpl(
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
class _$GuideLinkModelImpl implements _GuideLinkModel {
  const _$GuideLinkModelImpl(
      {required this.success, required this.message, required this.data});

  factory _$GuideLinkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuideLinkModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final Data data;

  @override
  String toString() {
    return 'GuideLinkModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuideLinkModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of GuideLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuideLinkModelImplCopyWith<_$GuideLinkModelImpl> get copyWith =>
      __$$GuideLinkModelImplCopyWithImpl<_$GuideLinkModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuideLinkModelImplToJson(
      this,
    );
  }
}

abstract class _GuideLinkModel implements GuideLinkModel {
  const factory _GuideLinkModel(
      {required final bool success,
      required final String message,
      required final Data data}) = _$GuideLinkModelImpl;

  factory _GuideLinkModel.fromJson(Map<String, dynamic> json) =
      _$GuideLinkModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Data get data;

  /// Create a copy of GuideLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuideLinkModelImplCopyWith<_$GuideLinkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  UpdatedCase get updatedCase => throw _privateConstructorUsedError;

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
  $Res call({UpdatedCase updatedCase});

  $UpdatedCaseCopyWith<$Res> get updatedCase;
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
    Object? updatedCase = null,
  }) {
    return _then(_value.copyWith(
      updatedCase: null == updatedCase
          ? _value.updatedCase
          : updatedCase // ignore: cast_nullable_to_non_nullable
              as UpdatedCase,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdatedCaseCopyWith<$Res> get updatedCase {
    return $UpdatedCaseCopyWith<$Res>(_value.updatedCase, (value) {
      return _then(_value.copyWith(updatedCase: value) as $Val);
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
  $Res call({UpdatedCase updatedCase});

  @override
  $UpdatedCaseCopyWith<$Res> get updatedCase;
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
    Object? updatedCase = null,
  }) {
    return _then(_$DataImpl(
      updatedCase: null == updatedCase
          ? _value.updatedCase
          : updatedCase // ignore: cast_nullable_to_non_nullable
              as UpdatedCase,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({required this.updatedCase});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final UpdatedCase updatedCase;

  @override
  String toString() {
    return 'Data(updatedCase: $updatedCase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.updatedCase, updatedCase) ||
                other.updatedCase == updatedCase));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, updatedCase);

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
  const factory _Data({required final UpdatedCase updatedCase}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  UpdatedCase get updatedCase;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdatedCase _$UpdatedCaseFromJson(Map<String, dynamic> json) {
  return _UpdatedCase.fromJson(json);
}

/// @nodoc
mixin _$UpdatedCase {
  Pdf get pdf => throw _privateConstructorUsedError;
  PdfTask get pdfTask => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
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
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get hospitalPatientId => throw _privateConstructorUsedError;
  int get mobileNumber => throw _privateConstructorUsedError;

  /// Serializes this UpdatedCase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatedCase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatedCaseCopyWith<UpdatedCase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatedCaseCopyWith<$Res> {
  factory $UpdatedCaseCopyWith(
          UpdatedCase value, $Res Function(UpdatedCase) then) =
      _$UpdatedCaseCopyWithImpl<$Res, UpdatedCase>;
  @useResult
  $Res call(
      {Pdf pdf,
      PdfTask pdfTask,
      @JsonKey(name: '_id') String id,
      int updatedAt,
      String hospitalId,
      String doctorId,
      String creatorId,
      int pageCount,
      int createdAt,
      List<int> pageNumbers,
      List<Additional> additionals,
      @JsonKey(name: '__v') int v,
      String email,
      String fullName,
      String gender,
      String hospitalPatientId,
      int mobileNumber});

  $PdfCopyWith<$Res> get pdf;
  $PdfTaskCopyWith<$Res> get pdfTask;
}

/// @nodoc
class _$UpdatedCaseCopyWithImpl<$Res, $Val extends UpdatedCase>
    implements $UpdatedCaseCopyWith<$Res> {
  _$UpdatedCaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatedCase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdf = null,
    Object? pdfTask = null,
    Object? id = null,
    Object? updatedAt = null,
    Object? hospitalId = null,
    Object? doctorId = null,
    Object? creatorId = null,
    Object? pageCount = null,
    Object? createdAt = null,
    Object? pageNumbers = null,
    Object? additionals = null,
    Object? v = null,
    Object? email = null,
    Object? fullName = null,
    Object? gender = null,
    Object? hospitalPatientId = null,
    Object? mobileNumber = null,
  }) {
    return _then(_value.copyWith(
      pdf: null == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as Pdf,
      pdfTask: null == pdfTask
          ? _value.pdfTask
          : pdfTask // ignore: cast_nullable_to_non_nullable
              as PdfTask,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalPatientId: null == hospitalPatientId
          ? _value.hospitalPatientId
          : hospitalPatientId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of UpdatedCase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PdfCopyWith<$Res> get pdf {
    return $PdfCopyWith<$Res>(_value.pdf, (value) {
      return _then(_value.copyWith(pdf: value) as $Val);
    });
  }

  /// Create a copy of UpdatedCase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PdfTaskCopyWith<$Res> get pdfTask {
    return $PdfTaskCopyWith<$Res>(_value.pdfTask, (value) {
      return _then(_value.copyWith(pdfTask: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdatedCaseImplCopyWith<$Res>
    implements $UpdatedCaseCopyWith<$Res> {
  factory _$$UpdatedCaseImplCopyWith(
          _$UpdatedCaseImpl value, $Res Function(_$UpdatedCaseImpl) then) =
      __$$UpdatedCaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Pdf pdf,
      PdfTask pdfTask,
      @JsonKey(name: '_id') String id,
      int updatedAt,
      String hospitalId,
      String doctorId,
      String creatorId,
      int pageCount,
      int createdAt,
      List<int> pageNumbers,
      List<Additional> additionals,
      @JsonKey(name: '__v') int v,
      String email,
      String fullName,
      String gender,
      String hospitalPatientId,
      int mobileNumber});

  @override
  $PdfCopyWith<$Res> get pdf;
  @override
  $PdfTaskCopyWith<$Res> get pdfTask;
}

/// @nodoc
class __$$UpdatedCaseImplCopyWithImpl<$Res>
    extends _$UpdatedCaseCopyWithImpl<$Res, _$UpdatedCaseImpl>
    implements _$$UpdatedCaseImplCopyWith<$Res> {
  __$$UpdatedCaseImplCopyWithImpl(
      _$UpdatedCaseImpl _value, $Res Function(_$UpdatedCaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatedCase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdf = null,
    Object? pdfTask = null,
    Object? id = null,
    Object? updatedAt = null,
    Object? hospitalId = null,
    Object? doctorId = null,
    Object? creatorId = null,
    Object? pageCount = null,
    Object? createdAt = null,
    Object? pageNumbers = null,
    Object? additionals = null,
    Object? v = null,
    Object? email = null,
    Object? fullName = null,
    Object? gender = null,
    Object? hospitalPatientId = null,
    Object? mobileNumber = null,
  }) {
    return _then(_$UpdatedCaseImpl(
      pdf: null == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as Pdf,
      pdfTask: null == pdfTask
          ? _value.pdfTask
          : pdfTask // ignore: cast_nullable_to_non_nullable
              as PdfTask,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalPatientId: null == hospitalPatientId
          ? _value.hospitalPatientId
          : hospitalPatientId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatedCaseImpl implements _UpdatedCase {
  const _$UpdatedCaseImpl(
      {required this.pdf,
      required this.pdfTask,
      @JsonKey(name: '_id') required this.id,
      required this.updatedAt,
      required this.hospitalId,
      required this.doctorId,
      required this.creatorId,
      required this.pageCount,
      required this.createdAt,
      required final List<int> pageNumbers,
      required final List<Additional> additionals,
      @JsonKey(name: '__v') required this.v,
      required this.email,
      required this.fullName,
      required this.gender,
      required this.hospitalPatientId,
      required this.mobileNumber})
      : _pageNumbers = pageNumbers,
        _additionals = additionals;

  factory _$UpdatedCaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatedCaseImplFromJson(json);

  @override
  final Pdf pdf;
  @override
  final PdfTask pdfTask;
  @override
  @JsonKey(name: '_id')
  final String id;
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
  final String email;
  @override
  final String fullName;
  @override
  final String gender;
  @override
  final String hospitalPatientId;
  @override
  final int mobileNumber;

  @override
  String toString() {
    return 'UpdatedCase(pdf: $pdf, pdfTask: $pdfTask, id: $id, updatedAt: $updatedAt, hospitalId: $hospitalId, doctorId: $doctorId, creatorId: $creatorId, pageCount: $pageCount, createdAt: $createdAt, pageNumbers: $pageNumbers, additionals: $additionals, v: $v, email: $email, fullName: $fullName, gender: $gender, hospitalPatientId: $hospitalPatientId, mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedCaseImpl &&
            (identical(other.pdf, pdf) || other.pdf == pdf) &&
            (identical(other.pdfTask, pdfTask) || other.pdfTask == pdfTask) &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.v, v) || other.v == v) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.hospitalPatientId, hospitalPatientId) ||
                other.hospitalPatientId == hospitalPatientId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pdf,
      pdfTask,
      id,
      updatedAt,
      hospitalId,
      doctorId,
      creatorId,
      pageCount,
      createdAt,
      const DeepCollectionEquality().hash(_pageNumbers),
      const DeepCollectionEquality().hash(_additionals),
      v,
      email,
      fullName,
      gender,
      hospitalPatientId,
      mobileNumber);

  /// Create a copy of UpdatedCase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedCaseImplCopyWith<_$UpdatedCaseImpl> get copyWith =>
      __$$UpdatedCaseImplCopyWithImpl<_$UpdatedCaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatedCaseImplToJson(
      this,
    );
  }
}

abstract class _UpdatedCase implements UpdatedCase {
  const factory _UpdatedCase(
      {required final Pdf pdf,
      required final PdfTask pdfTask,
      @JsonKey(name: '_id') required final String id,
      required final int updatedAt,
      required final String hospitalId,
      required final String doctorId,
      required final String creatorId,
      required final int pageCount,
      required final int createdAt,
      required final List<int> pageNumbers,
      required final List<Additional> additionals,
      @JsonKey(name: '__v') required final int v,
      required final String email,
      required final String fullName,
      required final String gender,
      required final String hospitalPatientId,
      required final int mobileNumber}) = _$UpdatedCaseImpl;

  factory _UpdatedCase.fromJson(Map<String, dynamic> json) =
      _$UpdatedCaseImpl.fromJson;

  @override
  Pdf get pdf;
  @override
  PdfTask get pdfTask;
  @override
  @JsonKey(name: '_id')
  String get id;
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
  @override
  String get email;
  @override
  String get fullName;
  @override
  String get gender;
  @override
  String get hospitalPatientId;
  @override
  int get mobileNumber;

  /// Create a copy of UpdatedCase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatedCaseImplCopyWith<_$UpdatedCaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pdf _$PdfFromJson(Map<String, dynamic> json) {
  return _Pdf.fromJson(json);
}

/// @nodoc
mixin _$Pdf {
  String get publicUrl => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Pdf to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pdf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfCopyWith<Pdf> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfCopyWith<$Res> {
  factory $PdfCopyWith(Pdf value, $Res Function(Pdf) then) =
      _$PdfCopyWithImpl<$Res, Pdf>;
  @useResult
  $Res call({String publicUrl, int updatedAt});
}

/// @nodoc
class _$PdfCopyWithImpl<$Res, $Val extends Pdf> implements $PdfCopyWith<$Res> {
  _$PdfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pdf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicUrl = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PdfImplCopyWith<$Res> implements $PdfCopyWith<$Res> {
  factory _$$PdfImplCopyWith(_$PdfImpl value, $Res Function(_$PdfImpl) then) =
      __$$PdfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String publicUrl, int updatedAt});
}

/// @nodoc
class __$$PdfImplCopyWithImpl<$Res> extends _$PdfCopyWithImpl<$Res, _$PdfImpl>
    implements _$$PdfImplCopyWith<$Res> {
  __$$PdfImplCopyWithImpl(_$PdfImpl _value, $Res Function(_$PdfImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pdf
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicUrl = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PdfImpl(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfImpl implements _Pdf {
  const _$PdfImpl({required this.publicUrl, required this.updatedAt});

  factory _$PdfImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfImplFromJson(json);

  @override
  final String publicUrl;
  @override
  final int updatedAt;

  @override
  String toString() {
    return 'Pdf(publicUrl: $publicUrl, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfImpl &&
            (identical(other.publicUrl, publicUrl) ||
                other.publicUrl == publicUrl) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publicUrl, updatedAt);

  /// Create a copy of Pdf
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfImplCopyWith<_$PdfImpl> get copyWith =>
      __$$PdfImplCopyWithImpl<_$PdfImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfImplToJson(
      this,
    );
  }
}

abstract class _Pdf implements Pdf {
  const factory _Pdf(
      {required final String publicUrl,
      required final int updatedAt}) = _$PdfImpl;

  factory _Pdf.fromJson(Map<String, dynamic> json) = _$PdfImpl.fromJson;

  @override
  String get publicUrl;
  @override
  int get updatedAt;

  /// Create a copy of Pdf
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfImplCopyWith<_$PdfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PdfTask _$PdfTaskFromJson(Map<String, dynamic> json) {
  return _PdfTask.fromJson(json);
}

/// @nodoc
mixin _$PdfTask {
  String get jobId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PdfTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PdfTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfTaskCopyWith<PdfTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfTaskCopyWith<$Res> {
  factory $PdfTaskCopyWith(PdfTask value, $Res Function(PdfTask) then) =
      _$PdfTaskCopyWithImpl<$Res, PdfTask>;
  @useResult
  $Res call({String jobId, String status, int updatedAt});
}

/// @nodoc
class _$PdfTaskCopyWithImpl<$Res, $Val extends PdfTask>
    implements $PdfTaskCopyWith<$Res> {
  _$PdfTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PdfTaskImplCopyWith<$Res> implements $PdfTaskCopyWith<$Res> {
  factory _$$PdfTaskImplCopyWith(
          _$PdfTaskImpl value, $Res Function(_$PdfTaskImpl) then) =
      __$$PdfTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jobId, String status, int updatedAt});
}

/// @nodoc
class __$$PdfTaskImplCopyWithImpl<$Res>
    extends _$PdfTaskCopyWithImpl<$Res, _$PdfTaskImpl>
    implements _$$PdfTaskImplCopyWith<$Res> {
  __$$PdfTaskImplCopyWithImpl(
      _$PdfTaskImpl _value, $Res Function(_$PdfTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PdfTaskImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfTaskImpl implements _PdfTask {
  const _$PdfTaskImpl(
      {required this.jobId, required this.status, required this.updatedAt});

  factory _$PdfTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfTaskImplFromJson(json);

  @override
  final String jobId;
  @override
  final String status;
  @override
  final int updatedAt;

  @override
  String toString() {
    return 'PdfTask(jobId: $jobId, status: $status, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfTaskImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jobId, status, updatedAt);

  /// Create a copy of PdfTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfTaskImplCopyWith<_$PdfTaskImpl> get copyWith =>
      __$$PdfTaskImplCopyWithImpl<_$PdfTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfTaskImplToJson(
      this,
    );
  }
}

abstract class _PdfTask implements PdfTask {
  const factory _PdfTask(
      {required final String jobId,
      required final String status,
      required final int updatedAt}) = _$PdfTaskImpl;

  factory _PdfTask.fromJson(Map<String, dynamic> json) = _$PdfTaskImpl.fromJson;

  @override
  String get jobId;
  @override
  String get status;
  @override
  int get updatedAt;

  /// Create a copy of PdfTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfTaskImplCopyWith<_$PdfTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Additional _$AdditionalFromJson(Map<String, dynamic> json) {
  return _Additional.fromJson(json);
}

/// @nodoc
mixin _$Additional {
  String get publicUrl => throw _privateConstructorUsedError;
  MetaData get metaData => throw _privateConstructorUsedError;
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
  $Res call({String publicUrl, MetaData metaData, Details details});

  $MetaDataCopyWith<$Res> get metaData;
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
    Object? metaData = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      metaData: null == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData,
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
  $MetaDataCopyWith<$Res> get metaData {
    return $MetaDataCopyWith<$Res>(_value.metaData, (value) {
      return _then(_value.copyWith(metaData: value) as $Val);
    });
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
  $Res call({String publicUrl, MetaData metaData, Details details});

  @override
  $MetaDataCopyWith<$Res> get metaData;
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
    Object? metaData = null,
    Object? details = null,
  }) {
    return _then(_$AdditionalImpl(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      metaData: null == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData,
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
      {required this.publicUrl, required this.metaData, required this.details});

  factory _$AdditionalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionalImplFromJson(json);

  @override
  final String publicUrl;
  @override
  final MetaData metaData;
  @override
  final Details details;

  @override
  String toString() {
    return 'Additional(publicUrl: $publicUrl, metaData: $metaData, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalImpl &&
            (identical(other.publicUrl, publicUrl) ||
                other.publicUrl == publicUrl) &&
            (identical(other.metaData, metaData) ||
                other.metaData == metaData) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publicUrl, metaData, details);

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
      {required final String publicUrl,
      required final MetaData metaData,
      required final Details details}) = _$AdditionalImpl;

  factory _Additional.fromJson(Map<String, dynamic> json) =
      _$AdditionalImpl.fromJson;

  @override
  String get publicUrl;
  @override
  MetaData get metaData;
  @override
  Details get details;

  /// Create a copy of Additional
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdditionalImplCopyWith<_$AdditionalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return _MetaData.fromJson(json);
}

/// @nodoc
mixin _$MetaData {
  String get type => throw _privateConstructorUsedError;
  String get mime => throw _privateConstructorUsedError;
  String get uploader => throw _privateConstructorUsedError;
  int get uploadedAt => throw _privateConstructorUsedError;
  String? get ext => throw _privateConstructorUsedError;

  /// Serializes this MetaData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaDataCopyWith<MetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDataCopyWith<$Res> {
  factory $MetaDataCopyWith(MetaData value, $Res Function(MetaData) then) =
      _$MetaDataCopyWithImpl<$Res, MetaData>;
  @useResult
  $Res call(
      {String type, String mime, String uploader, int uploadedAt, String? ext});
}

/// @nodoc
class _$MetaDataCopyWithImpl<$Res, $Val extends MetaData>
    implements $MetaDataCopyWith<$Res> {
  _$MetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? mime = null,
    Object? uploader = null,
    Object? uploadedAt = null,
    Object? ext = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      uploader: null == uploader
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as int,
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaDataImplCopyWith<$Res>
    implements $MetaDataCopyWith<$Res> {
  factory _$$MetaDataImplCopyWith(
          _$MetaDataImpl value, $Res Function(_$MetaDataImpl) then) =
      __$$MetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type, String mime, String uploader, int uploadedAt, String? ext});
}

/// @nodoc
class __$$MetaDataImplCopyWithImpl<$Res>
    extends _$MetaDataCopyWithImpl<$Res, _$MetaDataImpl>
    implements _$$MetaDataImplCopyWith<$Res> {
  __$$MetaDataImplCopyWithImpl(
      _$MetaDataImpl _value, $Res Function(_$MetaDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? mime = null,
    Object? uploader = null,
    Object? uploadedAt = null,
    Object? ext = freezed,
  }) {
    return _then(_$MetaDataImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      uploader: null == uploader
          ? _value.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as int,
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaDataImpl implements _MetaData {
  const _$MetaDataImpl(
      {required this.type,
      required this.mime,
      required this.uploader,
      required this.uploadedAt,
      this.ext});

  factory _$MetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaDataImplFromJson(json);

  @override
  final String type;
  @override
  final String mime;
  @override
  final String uploader;
  @override
  final int uploadedAt;
  @override
  final String? ext;

  @override
  String toString() {
    return 'MetaData(type: $type, mime: $mime, uploader: $uploader, uploadedAt: $uploadedAt, ext: $ext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaDataImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.ext, ext) || other.ext == ext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, mime, uploader, uploadedAt, ext);

  /// Create a copy of MetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
      __$$MetaDataImplCopyWithImpl<_$MetaDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaDataImplToJson(
      this,
    );
  }
}

abstract class _MetaData implements MetaData {
  const factory _MetaData(
      {required final String type,
      required final String mime,
      required final String uploader,
      required final int uploadedAt,
      final String? ext}) = _$MetaDataImpl;

  factory _MetaData.fromJson(Map<String, dynamic> json) =
      _$MetaDataImpl.fromJson;

  @override
  String get type;
  @override
  String get mime;
  @override
  String get uploader;
  @override
  int get uploadedAt;
  @override
  String? get ext;

  /// Create a copy of MetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaDataImplCopyWith<_$MetaDataImpl> get copyWith =>
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
