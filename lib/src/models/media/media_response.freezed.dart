// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaResponse _$MediaResponseFromJson(Map<String, dynamic> json) {
  return _MediaResponse.fromJson(json);
}

/// @nodoc
mixin _$MediaResponse {
  String get publicUrl => throw _privateConstructorUsedError;
  String get publicId => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this MediaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaResponseCopyWith<MediaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaResponseCopyWith<$Res> {
  factory $MediaResponseCopyWith(
          MediaResponse value, $Res Function(MediaResponse) then) =
      _$MediaResponseCopyWithImpl<$Res, MediaResponse>;
  @useResult
  $Res call({String publicUrl, String publicId, String mediaType, String id});
}

/// @nodoc
class _$MediaResponseCopyWithImpl<$Res, $Val extends MediaResponse>
    implements $MediaResponseCopyWith<$Res> {
  _$MediaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicUrl = null,
    Object? publicId = null,
    Object? mediaType = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaResponseImplCopyWith<$Res>
    implements $MediaResponseCopyWith<$Res> {
  factory _$$MediaResponseImplCopyWith(
          _$MediaResponseImpl value, $Res Function(_$MediaResponseImpl) then) =
      __$$MediaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String publicUrl, String publicId, String mediaType, String id});
}

/// @nodoc
class __$$MediaResponseImplCopyWithImpl<$Res>
    extends _$MediaResponseCopyWithImpl<$Res, _$MediaResponseImpl>
    implements _$$MediaResponseImplCopyWith<$Res> {
  __$$MediaResponseImplCopyWithImpl(
      _$MediaResponseImpl _value, $Res Function(_$MediaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicUrl = null,
    Object? publicId = null,
    Object? mediaType = null,
    Object? id = null,
  }) {
    return _then(_$MediaResponseImpl(
      publicUrl: null == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaResponseImpl implements _MediaResponse {
  const _$MediaResponseImpl(
      {required this.publicUrl,
      required this.publicId,
      required this.mediaType,
      required this.id});

  factory _$MediaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaResponseImplFromJson(json);

  @override
  final String publicUrl;
  @override
  final String publicId;
  @override
  final String mediaType;
  @override
  final String id;

  @override
  String toString() {
    return 'MediaResponse(publicUrl: $publicUrl, publicId: $publicId, mediaType: $mediaType, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaResponseImpl &&
            (identical(other.publicUrl, publicUrl) ||
                other.publicUrl == publicUrl) &&
            (identical(other.publicId, publicId) ||
                other.publicId == publicId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, publicUrl, publicId, mediaType, id);

  /// Create a copy of MediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaResponseImplCopyWith<_$MediaResponseImpl> get copyWith =>
      __$$MediaResponseImplCopyWithImpl<_$MediaResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaResponseImplToJson(
      this,
    );
  }
}

abstract class _MediaResponse implements MediaResponse {
  const factory _MediaResponse(
      {required final String publicUrl,
      required final String publicId,
      required final String mediaType,
      required final String id}) = _$MediaResponseImpl;

  factory _MediaResponse.fromJson(Map<String, dynamic> json) =
      _$MediaResponseImpl.fromJson;

  @override
  String get publicUrl;
  @override
  String get publicId;
  @override
  String get mediaType;
  @override
  String get id;

  /// Create a copy of MediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaResponseImplCopyWith<_$MediaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
