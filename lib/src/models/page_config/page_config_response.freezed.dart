// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_config_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageConfigResponse _$PageConfigResponseFromJson(Map<String, dynamic> json) {
  return _PageConfigResponse.fromJson(json);
}

/// @nodoc
mixin _$PageConfigResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  /// Serializes this PageConfigResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageConfigResponseCopyWith<PageConfigResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageConfigResponseCopyWith<$Res> {
  factory $PageConfigResponseCopyWith(
          PageConfigResponse value, $Res Function(PageConfigResponse) then) =
      _$PageConfigResponseCopyWithImpl<$Res, PageConfigResponse>;
  @useResult
  $Res call({bool success, String message, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$PageConfigResponseCopyWithImpl<$Res, $Val extends PageConfigResponse>
    implements $PageConfigResponseCopyWith<$Res> {
  _$PageConfigResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageConfigResponse
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

  /// Create a copy of PageConfigResponse
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
abstract class _$$PageConfigResponseImplCopyWith<$Res>
    implements $PageConfigResponseCopyWith<$Res> {
  factory _$$PageConfigResponseImplCopyWith(_$PageConfigResponseImpl value,
          $Res Function(_$PageConfigResponseImpl) then) =
      __$$PageConfigResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PageConfigResponseImplCopyWithImpl<$Res>
    extends _$PageConfigResponseCopyWithImpl<$Res, _$PageConfigResponseImpl>
    implements _$$PageConfigResponseImplCopyWith<$Res> {
  __$$PageConfigResponseImplCopyWithImpl(_$PageConfigResponseImpl _value,
      $Res Function(_$PageConfigResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PageConfigResponseImpl(
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
class _$PageConfigResponseImpl implements _PageConfigResponse {
  const _$PageConfigResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$PageConfigResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageConfigResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final Data data;

  @override
  String toString() {
    return 'PageConfigResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageConfigResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of PageConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageConfigResponseImplCopyWith<_$PageConfigResponseImpl> get copyWith =>
      __$$PageConfigResponseImplCopyWithImpl<_$PageConfigResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageConfigResponseImplToJson(
      this,
    );
  }
}

abstract class _PageConfigResponse implements PageConfigResponse {
  const factory _PageConfigResponse(
      {required final bool success,
      required final String message,
      required final Data data}) = _$PageConfigResponseImpl;

  factory _PageConfigResponse.fromJson(Map<String, dynamic> json) =
      _$PageConfigResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Data get data;

  /// Create a copy of PageConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageConfigResponseImplCopyWith<_$PageConfigResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  List<Guide> get guides => throw _privateConstructorUsedError;
  PageDetails get pageDetails => throw _privateConstructorUsedError;

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
  $Res call({List<Guide> guides, PageDetails pageDetails});

  $PageDetailsCopyWith<$Res> get pageDetails;
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
    Object? guides = null,
    Object? pageDetails = null,
  }) {
    return _then(_value.copyWith(
      guides: null == guides
          ? _value.guides
          : guides // ignore: cast_nullable_to_non_nullable
              as List<Guide>,
      pageDetails: null == pageDetails
          ? _value.pageDetails
          : pageDetails // ignore: cast_nullable_to_non_nullable
              as PageDetails,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageDetailsCopyWith<$Res> get pageDetails {
    return $PageDetailsCopyWith<$Res>(_value.pageDetails, (value) {
      return _then(_value.copyWith(pageDetails: value) as $Val);
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
  $Res call({List<Guide> guides, PageDetails pageDetails});

  @override
  $PageDetailsCopyWith<$Res> get pageDetails;
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
    Object? guides = null,
    Object? pageDetails = null,
  }) {
    return _then(_$DataImpl(
      guides: null == guides
          ? _value._guides
          : guides // ignore: cast_nullable_to_non_nullable
              as List<Guide>,
      pageDetails: null == pageDetails
          ? _value.pageDetails
          : pageDetails // ignore: cast_nullable_to_non_nullable
              as PageDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {required final List<Guide> guides, required this.pageDetails})
      : _guides = guides;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  final List<Guide> _guides;
  @override
  List<Guide> get guides {
    if (_guides is EqualUnmodifiableListView) return _guides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guides);
  }

  @override
  final PageDetails pageDetails;

  @override
  String toString() {
    return 'Data(guides: $guides, pageDetails: $pageDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._guides, _guides) &&
            (identical(other.pageDetails, pageDetails) ||
                other.pageDetails == pageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_guides), pageDetails);

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
      {required final List<Guide> guides,
      required final PageDetails pageDetails}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  List<Guide> get guides;
  @override
  PageDetails get pageDetails;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Guide _$GuideFromJson(Map<String, dynamic> json) {
  return _Guide.fromJson(json);
}

/// @nodoc
mixin _$Guide {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get hospitalId => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get mime => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;

  /// Serializes this Guide to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Guide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuideCopyWith<Guide> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuideCopyWith<$Res> {
  factory $GuideCopyWith(Guide value, $Res Function(Guide) then) =
      _$GuideCopyWithImpl<$Res, Guide>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String hospitalId,
      String doctorId,
      String description,
      int position,
      String url,
      String type,
      String mime,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class _$GuideCopyWithImpl<$Res, $Val extends Guide>
    implements $GuideCopyWith<$Res> {
  _$GuideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Guide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hospitalId = null,
    Object? doctorId = null,
    Object? description = null,
    Object? position = null,
    Object? url = null,
    Object? type = null,
    Object? mime = null,
    Object? v = null,
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
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuideImplCopyWith<$Res> implements $GuideCopyWith<$Res> {
  factory _$$GuideImplCopyWith(
          _$GuideImpl value, $Res Function(_$GuideImpl) then) =
      __$$GuideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String hospitalId,
      String doctorId,
      String description,
      int position,
      String url,
      String type,
      String mime,
      @JsonKey(name: '__v') int v});
}

/// @nodoc
class __$$GuideImplCopyWithImpl<$Res>
    extends _$GuideCopyWithImpl<$Res, _$GuideImpl>
    implements _$$GuideImplCopyWith<$Res> {
  __$$GuideImplCopyWithImpl(
      _$GuideImpl _value, $Res Function(_$GuideImpl) _then)
      : super(_value, _then);

  /// Create a copy of Guide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? hospitalId = null,
    Object? doctorId = null,
    Object? description = null,
    Object? position = null,
    Object? url = null,
    Object? type = null,
    Object? mime = null,
    Object? v = null,
  }) {
    return _then(_$GuideImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hospitalId: null == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
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
class _$GuideImpl implements _Guide {
  const _$GuideImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.hospitalId,
      required this.doctorId,
      required this.description,
      required this.position,
      required this.url,
      required this.type,
      required this.mime,
      @JsonKey(name: '__v') required this.v});

  factory _$GuideImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuideImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String hospitalId;
  @override
  final String doctorId;
  @override
  final String description;
  @override
  final int position;
  @override
  final String url;
  @override
  final String type;
  @override
  final String mime;
  @override
  @JsonKey(name: '__v')
  final int v;

  @override
  String toString() {
    return 'Guide(id: $id, name: $name, hospitalId: $hospitalId, doctorId: $doctorId, description: $description, position: $position, url: $url, type: $type, mime: $mime, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuideImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, hospitalId, doctorId,
      description, position, url, type, mime, v);

  /// Create a copy of Guide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuideImplCopyWith<_$GuideImpl> get copyWith =>
      __$$GuideImplCopyWithImpl<_$GuideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuideImplToJson(
      this,
    );
  }
}

abstract class _Guide implements Guide {
  const factory _Guide(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String hospitalId,
      required final String doctorId,
      required final String description,
      required final int position,
      required final String url,
      required final String type,
      required final String mime,
      @JsonKey(name: '__v') required final int v}) = _$GuideImpl;

  factory _Guide.fromJson(Map<String, dynamic> json) = _$GuideImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get hospitalId;
  @override
  String get doctorId;
  @override
  String get description;
  @override
  int get position;
  @override
  String get url;
  @override
  String get type;
  @override
  String get mime;
  @override
  @JsonKey(name: '__v')
  int get v;

  /// Create a copy of Guide
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuideImplCopyWith<_$GuideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PageDetails _$PageDetailsFromJson(Map<String, dynamic> json) {
  return _PageDetails.fromJson(json);
}

/// @nodoc
mixin _$PageDetails {
  int get pageHeight => throw _privateConstructorUsedError;
  int get pageWidth => throw _privateConstructorUsedError;
  String get pageBackground => throw _privateConstructorUsedError;
  String get configUrl => throw _privateConstructorUsedError;
  int? get pageNumber => throw _privateConstructorUsedError;
  List<Point>? get points => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: "__v")
  int? get v => throw _privateConstructorUsedError;

  /// Serializes this PageDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageDetailsCopyWith<PageDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageDetailsCopyWith<$Res> {
  factory $PageDetailsCopyWith(
          PageDetails value, $Res Function(PageDetails) then) =
      _$PageDetailsCopyWithImpl<$Res, PageDetails>;
  @useResult
  $Res call(
      {int pageHeight,
      int pageWidth,
      String pageBackground,
      String configUrl,
      int? pageNumber,
      List<Point>? points,
      int? height,
      int? width,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class _$PageDetailsCopyWithImpl<$Res, $Val extends PageDetails>
    implements $PageDetailsCopyWith<$Res> {
  _$PageDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageHeight = null,
    Object? pageWidth = null,
    Object? pageBackground = null,
    Object? configUrl = null,
    Object? pageNumber = freezed,
    Object? points = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      pageHeight: null == pageHeight
          ? _value.pageHeight
          : pageHeight // ignore: cast_nullable_to_non_nullable
              as int,
      pageWidth: null == pageWidth
          ? _value.pageWidth
          : pageWidth // ignore: cast_nullable_to_non_nullable
              as int,
      pageBackground: null == pageBackground
          ? _value.pageBackground
          : pageBackground // ignore: cast_nullable_to_non_nullable
              as String,
      configUrl: null == configUrl
          ? _value.configUrl
          : configUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageDetailsImplCopyWith<$Res>
    implements $PageDetailsCopyWith<$Res> {
  factory _$$PageDetailsImplCopyWith(
          _$PageDetailsImpl value, $Res Function(_$PageDetailsImpl) then) =
      __$$PageDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pageHeight,
      int pageWidth,
      String pageBackground,
      String configUrl,
      int? pageNumber,
      List<Point>? points,
      int? height,
      int? width,
      @JsonKey(name: "__v") int? v});
}

/// @nodoc
class __$$PageDetailsImplCopyWithImpl<$Res>
    extends _$PageDetailsCopyWithImpl<$Res, _$PageDetailsImpl>
    implements _$$PageDetailsImplCopyWith<$Res> {
  __$$PageDetailsImplCopyWithImpl(
      _$PageDetailsImpl _value, $Res Function(_$PageDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageHeight = null,
    Object? pageWidth = null,
    Object? pageBackground = null,
    Object? configUrl = null,
    Object? pageNumber = freezed,
    Object? points = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? v = freezed,
  }) {
    return _then(_$PageDetailsImpl(
      pageHeight: null == pageHeight
          ? _value.pageHeight
          : pageHeight // ignore: cast_nullable_to_non_nullable
              as int,
      pageWidth: null == pageWidth
          ? _value.pageWidth
          : pageWidth // ignore: cast_nullable_to_non_nullable
              as int,
      pageBackground: null == pageBackground
          ? _value.pageBackground
          : pageBackground // ignore: cast_nullable_to_non_nullable
              as String,
      configUrl: null == configUrl
          ? _value.configUrl
          : configUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageDetailsImpl implements _PageDetails {
  const _$PageDetailsImpl(
      {required this.pageHeight,
      required this.pageWidth,
      required this.pageBackground,
      required this.configUrl,
      this.pageNumber,
      final List<Point>? points,
      this.height,
      this.width,
      @JsonKey(name: "__v") this.v})
      : _points = points;

  factory _$PageDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageDetailsImplFromJson(json);

  @override
  final int pageHeight;
  @override
  final int pageWidth;
  @override
  final String pageBackground;
  @override
  final String configUrl;
  @override
  final int? pageNumber;
  final List<Point>? _points;
  @override
  List<Point>? get points {
    final value = _points;
    if (value == null) return null;
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? height;
  @override
  final int? width;
  @override
  @JsonKey(name: "__v")
  final int? v;

  @override
  String toString() {
    return 'PageDetails(pageHeight: $pageHeight, pageWidth: $pageWidth, pageBackground: $pageBackground, configUrl: $configUrl, pageNumber: $pageNumber, points: $points, height: $height, width: $width, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageDetailsImpl &&
            (identical(other.pageHeight, pageHeight) ||
                other.pageHeight == pageHeight) &&
            (identical(other.pageWidth, pageWidth) ||
                other.pageWidth == pageWidth) &&
            (identical(other.pageBackground, pageBackground) ||
                other.pageBackground == pageBackground) &&
            (identical(other.configUrl, configUrl) ||
                other.configUrl == configUrl) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageHeight,
      pageWidth,
      pageBackground,
      configUrl,
      pageNumber,
      const DeepCollectionEquality().hash(_points),
      height,
      width,
      v);

  /// Create a copy of PageDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageDetailsImplCopyWith<_$PageDetailsImpl> get copyWith =>
      __$$PageDetailsImplCopyWithImpl<_$PageDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageDetailsImplToJson(
      this,
    );
  }
}

abstract class _PageDetails implements PageDetails {
  const factory _PageDetails(
      {required final int pageHeight,
      required final int pageWidth,
      required final String pageBackground,
      required final String configUrl,
      final int? pageNumber,
      final List<Point>? points,
      final int? height,
      final int? width,
      @JsonKey(name: "__v") final int? v}) = _$PageDetailsImpl;

  factory _PageDetails.fromJson(Map<String, dynamic> json) =
      _$PageDetailsImpl.fromJson;

  @override
  int get pageHeight;
  @override
  int get pageWidth;
  @override
  String get pageBackground;
  @override
  String get configUrl;
  @override
  int? get pageNumber;
  @override
  List<Point>? get points;
  @override
  int? get height;
  @override
  int? get width;
  @override
  @JsonKey(name: "__v")
  int? get v;

  /// Create a copy of PageDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageDetailsImplCopyWith<_$PageDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
