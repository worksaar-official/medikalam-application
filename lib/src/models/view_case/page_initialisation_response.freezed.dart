// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_initialisation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageInitialisationResponse _$PageInitialisationResponseFromJson(
    Map<String, dynamic> json) {
  return _PageInitialisationResponse.fromJson(json);
}

/// @nodoc
mixin _$PageInitialisationResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PageData get data => throw _privateConstructorUsedError;

  /// Serializes this PageInitialisationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageInitialisationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageInitialisationResponseCopyWith<PageInitialisationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInitialisationResponseCopyWith<$Res> {
  factory $PageInitialisationResponseCopyWith(PageInitialisationResponse value,
          $Res Function(PageInitialisationResponse) then) =
      _$PageInitialisationResponseCopyWithImpl<$Res,
          PageInitialisationResponse>;
  @useResult
  $Res call({bool success, String message, PageData data});

  $PageDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PageInitialisationResponseCopyWithImpl<$Res,
        $Val extends PageInitialisationResponse>
    implements $PageInitialisationResponseCopyWith<$Res> {
  _$PageInitialisationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageInitialisationResponse
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
              as PageData,
    ) as $Val);
  }

  /// Create a copy of PageInitialisationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageDataCopyWith<$Res> get data {
    return $PageDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PageInitialisationResponseImplCopyWith<$Res>
    implements $PageInitialisationResponseCopyWith<$Res> {
  factory _$$PageInitialisationResponseImplCopyWith(
          _$PageInitialisationResponseImpl value,
          $Res Function(_$PageInitialisationResponseImpl) then) =
      __$$PageInitialisationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, PageData data});

  @override
  $PageDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PageInitialisationResponseImplCopyWithImpl<$Res>
    extends _$PageInitialisationResponseCopyWithImpl<$Res,
        _$PageInitialisationResponseImpl>
    implements _$$PageInitialisationResponseImplCopyWith<$Res> {
  __$$PageInitialisationResponseImplCopyWithImpl(
      _$PageInitialisationResponseImpl _value,
      $Res Function(_$PageInitialisationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageInitialisationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PageInitialisationResponseImpl(
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
              as PageData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageInitialisationResponseImpl implements _PageInitialisationResponse {
  const _$PageInitialisationResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$PageInitialisationResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PageInitialisationResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final PageData data;

  @override
  String toString() {
    return 'PageInitialisationResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageInitialisationResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of PageInitialisationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageInitialisationResponseImplCopyWith<_$PageInitialisationResponseImpl>
      get copyWith => __$$PageInitialisationResponseImplCopyWithImpl<
          _$PageInitialisationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageInitialisationResponseImplToJson(
      this,
    );
  }
}

abstract class _PageInitialisationResponse
    implements PageInitialisationResponse {
  const factory _PageInitialisationResponse(
      {required final bool success,
      required final String message,
      required final PageData data}) = _$PageInitialisationResponseImpl;

  factory _PageInitialisationResponse.fromJson(Map<String, dynamic> json) =
      _$PageInitialisationResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  PageData get data;

  /// Create a copy of PageInitialisationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageInitialisationResponseImplCopyWith<_$PageInitialisationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PageData _$PageDataFromJson(Map<String, dynamic> json) {
  return _PageData.fromJson(json);
}

/// @nodoc
mixin _$PageData {
  bool get isNewPage => throw _privateConstructorUsedError;
  Page get page => throw _privateConstructorUsedError;

  /// Serializes this PageData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageDataCopyWith<PageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageDataCopyWith<$Res> {
  factory $PageDataCopyWith(PageData value, $Res Function(PageData) then) =
      _$PageDataCopyWithImpl<$Res, PageData>;
  @useResult
  $Res call({bool isNewPage, Page page});

  $PageCopyWith<$Res> get page;
}

/// @nodoc
class _$PageDataCopyWithImpl<$Res, $Val extends PageData>
    implements $PageDataCopyWith<$Res> {
  _$PageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNewPage = null,
    Object? page = null,
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
    ) as $Val);
  }

  /// Create a copy of PageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageCopyWith<$Res> get page {
    return $PageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PageDataImplCopyWith<$Res>
    implements $PageDataCopyWith<$Res> {
  factory _$$PageDataImplCopyWith(
          _$PageDataImpl value, $Res Function(_$PageDataImpl) then) =
      __$$PageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isNewPage, Page page});

  @override
  $PageCopyWith<$Res> get page;
}

/// @nodoc
class __$$PageDataImplCopyWithImpl<$Res>
    extends _$PageDataCopyWithImpl<$Res, _$PageDataImpl>
    implements _$$PageDataImplCopyWith<$Res> {
  __$$PageDataImplCopyWithImpl(
      _$PageDataImpl _value, $Res Function(_$PageDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNewPage = null,
    Object? page = null,
  }) {
    return _then(_$PageDataImpl(
      isNewPage: null == isNewPage
          ? _value.isNewPage
          : isNewPage // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Page,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageDataImpl implements _PageData {
  const _$PageDataImpl({this.isNewPage = false, required this.page});

  factory _$PageDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageDataImplFromJson(json);

  @override
  @JsonKey()
  final bool isNewPage;
  @override
  final Page page;

  @override
  String toString() {
    return 'PageData(isNewPage: $isNewPage, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageDataImpl &&
            (identical(other.isNewPage, isNewPage) ||
                other.isNewPage == isNewPage) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isNewPage, page);

  /// Create a copy of PageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageDataImplCopyWith<_$PageDataImpl> get copyWith =>
      __$$PageDataImplCopyWithImpl<_$PageDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageDataImplToJson(
      this,
    );
  }
}

abstract class _PageData implements PageData {
  const factory _PageData({final bool isNewPage, required final Page page}) =
      _$PageDataImpl;

  factory _PageData.fromJson(Map<String, dynamic> json) =
      _$PageDataImpl.fromJson;

  @override
  bool get isNewPage;
  @override
  Page get page;

  /// Create a copy of PageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageDataImplCopyWith<_$PageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Page _$PageFromJson(Map<String, dynamic> json) {
  return _Page.fromJson(json);
}

/// @nodoc
mixin _$Page {
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
  List<Point> get points => throw _privateConstructorUsedError;

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
      {String id,
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
      List<Point> points});
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
              as List<Point>,
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
      {String id,
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
      List<Point> points});
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
              as List<Point>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageImpl implements _Page {
  const _$PageImpl(
      {required this.id,
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
      required final List<Point> points})
      : _points = points;

  factory _$PageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageImplFromJson(json);

  @override
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
  final List<Point> _points;
  @override
  List<Point> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'Page(id: $id, hospitalId: $hospitalId, caseId: $caseId, creatorId: $creatorId, doctorId: $doctorId, createdAt: $createdAt, updatedAt: $updatedAt, pageNumber: $pageNumber, width: $width, height: $height, pageType: $pageType, points: $points)';
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
            const DeepCollectionEquality().equals(other._points, _points));
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
      const DeepCollectionEquality().hash(_points));

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
      {required final String id,
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
      required final List<Point> points}) = _$PageImpl;

  factory _Page.fromJson(Map<String, dynamic> json) = _$PageImpl.fromJson;

  @override
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
  List<Point> get points;

  /// Create a copy of Page
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageImplCopyWith<_$PageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
