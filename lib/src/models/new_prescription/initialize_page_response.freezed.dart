// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initialize_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InitializePageResponse _$InitializePageResponseFromJson(
    Map<String, dynamic> json) {
  return _InitializePageResponse.fromJson(json);
}

/// @nodoc
mixin _$InitializePageResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  InitializeResponse get data => throw _privateConstructorUsedError;

  /// Serializes this InitializePageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InitializePageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitializePageResponseCopyWith<InitializePageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializePageResponseCopyWith<$Res> {
  factory $InitializePageResponseCopyWith(InitializePageResponse value,
          $Res Function(InitializePageResponse) then) =
      _$InitializePageResponseCopyWithImpl<$Res, InitializePageResponse>;
  @useResult
  $Res call({bool success, String message, InitializeResponse data});

  $InitializeResponseCopyWith<$Res> get data;
}

/// @nodoc
class _$InitializePageResponseCopyWithImpl<$Res,
        $Val extends InitializePageResponse>
    implements $InitializePageResponseCopyWith<$Res> {
  _$InitializePageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitializePageResponse
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
              as InitializeResponse,
    ) as $Val);
  }

  /// Create a copy of InitializePageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InitializeResponseCopyWith<$Res> get data {
    return $InitializeResponseCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitializePageResponseImplCopyWith<$Res>
    implements $InitializePageResponseCopyWith<$Res> {
  factory _$$InitializePageResponseImplCopyWith(
          _$InitializePageResponseImpl value,
          $Res Function(_$InitializePageResponseImpl) then) =
      __$$InitializePageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, InitializeResponse data});

  @override
  $InitializeResponseCopyWith<$Res> get data;
}

/// @nodoc
class __$$InitializePageResponseImplCopyWithImpl<$Res>
    extends _$InitializePageResponseCopyWithImpl<$Res,
        _$InitializePageResponseImpl>
    implements _$$InitializePageResponseImplCopyWith<$Res> {
  __$$InitializePageResponseImplCopyWithImpl(
      _$InitializePageResponseImpl _value,
      $Res Function(_$InitializePageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitializePageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$InitializePageResponseImpl(
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
              as InitializeResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitializePageResponseImpl implements _InitializePageResponse {
  const _$InitializePageResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$InitializePageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitializePageResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final InitializeResponse data;

  @override
  String toString() {
    return 'InitializePageResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializePageResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of InitializePageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializePageResponseImplCopyWith<_$InitializePageResponseImpl>
      get copyWith => __$$InitializePageResponseImplCopyWithImpl<
          _$InitializePageResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitializePageResponseImplToJson(
      this,
    );
  }
}

abstract class _InitializePageResponse implements InitializePageResponse {
  const factory _InitializePageResponse(
      {required final bool success,
      required final String message,
      required final InitializeResponse data}) = _$InitializePageResponseImpl;

  factory _InitializePageResponse.fromJson(Map<String, dynamic> json) =
      _$InitializePageResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  InitializeResponse get data;

  /// Create a copy of InitializePageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializePageResponseImplCopyWith<_$InitializePageResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InitializeResponse _$InitializeResponseFromJson(Map<String, dynamic> json) {
  return _InitializeResponse.fromJson(json);
}

/// @nodoc
mixin _$InitializeResponse {
  bool get isNewPage => throw _privateConstructorUsedError;
  Page get page => throw _privateConstructorUsedError;
  PatientResponse? get patient => throw _privateConstructorUsedError;

  /// Serializes this InitializeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InitializeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InitializeResponseCopyWith<InitializeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializeResponseCopyWith<$Res> {
  factory $InitializeResponseCopyWith(
          InitializeResponse value, $Res Function(InitializeResponse) then) =
      _$InitializeResponseCopyWithImpl<$Res, InitializeResponse>;
  @useResult
  $Res call({bool isNewPage, Page page, PatientResponse? patient});

  $PageCopyWith<$Res> get page;
  $PatientResponseCopyWith<$Res>? get patient;
}

/// @nodoc
class _$InitializeResponseCopyWithImpl<$Res, $Val extends InitializeResponse>
    implements $InitializeResponseCopyWith<$Res> {
  _$InitializeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InitializeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNewPage = null,
    Object? page = null,
    Object? patient = freezed,
  }) {
    return _then(_value.copyWith(
      isNewPage: null == isNewPage
          ? _value.isNewPage
          : isNewPage // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientResponse?,
    ) as $Val);
  }

  /// Create a copy of InitializeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res> get page {
    return $PageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }

  /// Create a copy of InitializeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientResponseCopyWith<$Res>? get patient {
    if (_value.patient == null) {
      return null;
    }

    return $PatientResponseCopyWith<$Res>(_value.patient!, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitializeResponseImplCopyWith<$Res>
    implements $InitializeResponseCopyWith<$Res> {
  factory _$$InitializeResponseImplCopyWith(_$InitializeResponseImpl value,
          $Res Function(_$InitializeResponseImpl) then) =
      __$$InitializeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isNewPage, Page page, PatientResponse? patient});

  @override
  $PageCopyWith<$Res> get page;
  @override
  $PatientResponseCopyWith<$Res>? get patient;
}

/// @nodoc
class __$$InitializeResponseImplCopyWithImpl<$Res>
    extends _$InitializeResponseCopyWithImpl<$Res, _$InitializeResponseImpl>
    implements _$$InitializeResponseImplCopyWith<$Res> {
  __$$InitializeResponseImplCopyWithImpl(_$InitializeResponseImpl _value,
      $Res Function(_$InitializeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of InitializeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNewPage = null,
    Object? page = null,
    Object? patient = freezed,
  }) {
    return _then(_$InitializeResponseImpl(
      isNewPage: null == isNewPage
          ? _value.isNewPage
          : isNewPage // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as PatientResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitializeResponseImpl implements _InitializeResponse {
  const _$InitializeResponseImpl(
      {required this.isNewPage, required this.page, this.patient});

  factory _$InitializeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitializeResponseImplFromJson(json);

  @override
  final bool isNewPage;
  @override
  final Page page;
  @override
  final PatientResponse? patient;

  @override
  String toString() {
    return 'InitializeResponse(isNewPage: $isNewPage, page: $page, patient: $patient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeResponseImpl &&
            (identical(other.isNewPage, isNewPage) ||
                other.isNewPage == isNewPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.patient, patient) || other.patient == patient));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isNewPage, page, patient);

  /// Create a copy of InitializeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeResponseImplCopyWith<_$InitializeResponseImpl> get copyWith =>
      __$$InitializeResponseImplCopyWithImpl<_$InitializeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitializeResponseImplToJson(
      this,
    );
  }
}

abstract class _InitializeResponse implements InitializeResponse {
  const factory _InitializeResponse(
      {required final bool isNewPage,
      required final Page page,
      final PatientResponse? patient}) = _$InitializeResponseImpl;

  factory _InitializeResponse.fromJson(Map<String, dynamic> json) =
      _$InitializeResponseImpl.fromJson;

  @override
  bool get isNewPage;
  @override
  Page get page;
  @override
  PatientResponse? get patient;

  /// Create a copy of InitializeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeResponseImplCopyWith<_$InitializeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Page _$PageFromJson(Map<String, dynamic> json) {
  return _Page.fromJson(json);
}

/// @nodoc
mixin _$Page {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get hospitalId => throw _privateConstructorUsedError;
  String get caseId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get pageType => throw _privateConstructorUsedError;
  List<dynamic> get points => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;
  String? get hospitalPatientId => throw _privateConstructorUsedError;
  int? get mobileNumber => throw _privateConstructorUsedError;

  /// Serializes this Page to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageCopyWith<Page> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageCopyWith<$Res> {
  factory $PageCopyWith(Page value, $Res Function(Page) then) =
      _$PageCopyWithImpl<$Res, Page>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String hospitalId,
      String caseId,
      String creatorId,
      String doctorId,
      int createdAt,
      int updatedAt,
      int pageNumber,
      int width,
      int height,
      String pageType,
      List<dynamic> points,
      @JsonKey(name: '__v') int v,
      String? hospitalPatientId,
      int? mobileNumber});
}

/// @nodoc
class _$PageCopyWithImpl<$Res, $Val extends Page>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hospitalId = null,
    Object? caseId = null,
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
    Object? hospitalPatientId = freezed,
    Object? mobileNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      caseId: null == caseId
          ? _value.caseId
          : caseId // ignore: cast_nullable_to_non_nullable
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
              as List<dynamic>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalPatientId: freezed == hospitalPatientId
          ? _value.hospitalPatientId
          : hospitalPatientId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageImplCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$$PageImplCopyWith(
          _$PageImpl value, $Res Function(_$PageImpl) then) =
      __$$PageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String hospitalId,
      String caseId,
      String creatorId,
      String doctorId,
      int createdAt,
      int updatedAt,
      int pageNumber,
      int width,
      int height,
      String pageType,
      List<dynamic> points,
      @JsonKey(name: '__v') int v,
      String? hospitalPatientId,
      int? mobileNumber});
}

/// @nodoc
class __$$PageImplCopyWithImpl<$Res>
    extends _$PageCopyWithImpl<$Res, _$PageImpl>
    implements _$$PageImplCopyWith<$Res> {
  __$$PageImplCopyWithImpl(_$PageImpl _value, $Res Function(_$PageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hospitalId = null,
    Object? caseId = null,
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
    Object? hospitalPatientId = freezed,
    Object? mobileNumber = freezed,
  }) {
    return _then(_$PageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      caseId: null == caseId
          ? _value.caseId
          : caseId // ignore: cast_nullable_to_non_nullable
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
              as List<dynamic>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      hospitalPatientId: freezed == hospitalPatientId
          ? _value.hospitalPatientId
          : hospitalPatientId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageImpl implements _Page {
  const _$PageImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.hospitalId,
      required this.caseId,
      required this.creatorId,
      required this.doctorId,
      required this.createdAt,
      required this.updatedAt,
      required this.pageNumber,
      required this.width,
      required this.height,
      required this.pageType,
      required final List<dynamic> points,
      @JsonKey(name: '__v') required this.v,
      this.hospitalPatientId,
      this.mobileNumber})
      : _points = points;

  factory _$PageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String hospitalId;
  @override
  final String caseId;
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
  final List<dynamic> _points;
  @override
  List<dynamic> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  @JsonKey(name: '__v')
  final int v;
  @override
  final String? hospitalPatientId;
  @override
  final int? mobileNumber;

  @override
  String toString() {
    return 'Page(id: $id, hospitalId: $hospitalId, caseId: $caseId, creatorId: $creatorId, doctorId: $doctorId, createdAt: $createdAt, updatedAt: $updatedAt, pageNumber: $pageNumber, width: $width, height: $height, pageType: $pageType, points: $points, v: $v, hospitalPatientId: $hospitalPatientId, mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.caseId, caseId) || other.caseId == caseId) &&
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
            (identical(other.v, v) || other.v == v) &&
            (identical(other.hospitalPatientId, hospitalPatientId) ||
                other.hospitalPatientId == hospitalPatientId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      hospitalId,
      caseId,
      creatorId,
      doctorId,
      createdAt,
      updatedAt,
      pageNumber,
      width,
      height,
      pageType,
      const DeepCollectionEquality().hash(_points),
      v,
      hospitalPatientId,
      mobileNumber);

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageImplCopyWith<_$PageImpl> get copyWith =>
      __$$PageImplCopyWithImpl<_$PageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageImplToJson(
      this,
    );
  }
}

abstract class _Page implements Page {
  const factory _Page(
      {@JsonKey(name: '_id') required final String id,
      required final String hospitalId,
      required final String caseId,
      required final String creatorId,
      required final String doctorId,
      required final int createdAt,
      required final int updatedAt,
      required final int pageNumber,
      required final int width,
      required final int height,
      required final String pageType,
      required final List<dynamic> points,
      @JsonKey(name: '__v') required final int v,
      final String? hospitalPatientId,
      final int? mobileNumber}) = _$PageImpl;

  factory _Page.fromJson(Map<String, dynamic> json) = _$PageImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get hospitalId;
  @override
  String get caseId;
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
  List<dynamic> get points;
  @override
  @JsonKey(name: '__v')
  int get v;
  @override
  String? get hospitalPatientId;
  @override
  int? get mobileNumber;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageImplCopyWith<_$PageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
