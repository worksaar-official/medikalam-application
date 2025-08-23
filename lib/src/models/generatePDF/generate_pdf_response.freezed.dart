// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_pdf_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PdfGenerationModel _$PdfGenerationModelFromJson(Map<String, dynamic> json) {
  return _PdfGenerationModel.fromJson(json);
}

/// @nodoc
mixin _$PdfGenerationModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PdfData get data => throw _privateConstructorUsedError;

  /// Serializes this PdfGenerationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PdfGenerationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfGenerationModelCopyWith<PdfGenerationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfGenerationModelCopyWith<$Res> {
  factory $PdfGenerationModelCopyWith(
          PdfGenerationModel value, $Res Function(PdfGenerationModel) then) =
      _$PdfGenerationModelCopyWithImpl<$Res, PdfGenerationModel>;
  @useResult
  $Res call({bool success, String message, PdfData data});

  $PdfDataCopyWith<$Res> get data;
}

/// @nodoc
class _$PdfGenerationModelCopyWithImpl<$Res, $Val extends PdfGenerationModel>
    implements $PdfGenerationModelCopyWith<$Res> {
  _$PdfGenerationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfGenerationModel
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
              as PdfData,
    ) as $Val);
  }

  /// Create a copy of PdfGenerationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PdfDataCopyWith<$Res> get data {
    return $PdfDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PdfGenerationModelImplCopyWith<$Res>
    implements $PdfGenerationModelCopyWith<$Res> {
  factory _$$PdfGenerationModelImplCopyWith(_$PdfGenerationModelImpl value,
          $Res Function(_$PdfGenerationModelImpl) then) =
      __$$PdfGenerationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, PdfData data});

  @override
  $PdfDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PdfGenerationModelImplCopyWithImpl<$Res>
    extends _$PdfGenerationModelCopyWithImpl<$Res, _$PdfGenerationModelImpl>
    implements _$$PdfGenerationModelImplCopyWith<$Res> {
  __$$PdfGenerationModelImplCopyWithImpl(_$PdfGenerationModelImpl _value,
      $Res Function(_$PdfGenerationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfGenerationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$PdfGenerationModelImpl(
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
              as PdfData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfGenerationModelImpl implements _PdfGenerationModel {
  const _$PdfGenerationModelImpl(
      {required this.success, required this.message, required this.data});

  factory _$PdfGenerationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfGenerationModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final PdfData data;

  @override
  String toString() {
    return 'PdfGenerationModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfGenerationModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of PdfGenerationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfGenerationModelImplCopyWith<_$PdfGenerationModelImpl> get copyWith =>
      __$$PdfGenerationModelImplCopyWithImpl<_$PdfGenerationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfGenerationModelImplToJson(
      this,
    );
  }
}

abstract class _PdfGenerationModel implements PdfGenerationModel {
  const factory _PdfGenerationModel(
      {required final bool success,
      required final String message,
      required final PdfData data}) = _$PdfGenerationModelImpl;

  factory _PdfGenerationModel.fromJson(Map<String, dynamic> json) =
      _$PdfGenerationModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  PdfData get data;

  /// Create a copy of PdfGenerationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfGenerationModelImplCopyWith<_$PdfGenerationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PdfData _$PdfDataFromJson(Map<String, dynamic> json) {
  return _PdfData.fromJson(json);
}

/// @nodoc
mixin _$PdfData {
  String get pdfUrl => throw _privateConstructorUsedError;

  /// Serializes this PdfData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PdfData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfDataCopyWith<PdfData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfDataCopyWith<$Res> {
  factory $PdfDataCopyWith(PdfData value, $Res Function(PdfData) then) =
      _$PdfDataCopyWithImpl<$Res, PdfData>;
  @useResult
  $Res call({String pdfUrl});
}

/// @nodoc
class _$PdfDataCopyWithImpl<$Res, $Val extends PdfData>
    implements $PdfDataCopyWith<$Res> {
  _$PdfDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfUrl = null,
  }) {
    return _then(_value.copyWith(
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PdfDataImplCopyWith<$Res> implements $PdfDataCopyWith<$Res> {
  factory _$$PdfDataImplCopyWith(
          _$PdfDataImpl value, $Res Function(_$PdfDataImpl) then) =
      __$$PdfDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pdfUrl});
}

/// @nodoc
class __$$PdfDataImplCopyWithImpl<$Res>
    extends _$PdfDataCopyWithImpl<$Res, _$PdfDataImpl>
    implements _$$PdfDataImplCopyWith<$Res> {
  __$$PdfDataImplCopyWithImpl(
      _$PdfDataImpl _value, $Res Function(_$PdfDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfUrl = null,
  }) {
    return _then(_$PdfDataImpl(
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfDataImpl implements _PdfData {
  const _$PdfDataImpl({required this.pdfUrl});

  factory _$PdfDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfDataImplFromJson(json);

  @override
  final String pdfUrl;

  @override
  String toString() {
    return 'PdfData(pdfUrl: $pdfUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfDataImpl &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pdfUrl);

  /// Create a copy of PdfData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfDataImplCopyWith<_$PdfDataImpl> get copyWith =>
      __$$PdfDataImplCopyWithImpl<_$PdfDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfDataImplToJson(
      this,
    );
  }
}

abstract class _PdfData implements PdfData {
  const factory _PdfData({required final String pdfUrl}) = _$PdfDataImpl;

  factory _PdfData.fromJson(Map<String, dynamic> json) = _$PdfDataImpl.fromJson;

  @override
  String get pdfUrl;

  /// Create a copy of PdfData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfDataImplCopyWith<_$PdfDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
