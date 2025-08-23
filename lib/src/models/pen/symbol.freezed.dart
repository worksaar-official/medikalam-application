// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symbol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PenSymbol _$PenSymbolFromJson(Map<String, dynamic> json) {
  return Pen_Symbol.fromJson(json);
}

/// @nodoc
mixin _$PenSymbol {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get xmin => throw _privateConstructorUsedError;
  double get ymin => throw _privateConstructorUsedError;
  double get xmax => throw _privateConstructorUsedError;
  double get ymax => throw _privateConstructorUsedError;

  /// Serializes this PenSymbol to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PenSymbol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PenSymbolCopyWith<PenSymbol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PenSymbolCopyWith<$Res> {
  factory $PenSymbolCopyWith(PenSymbol value, $Res Function(PenSymbol) then) =
      _$PenSymbolCopyWithImpl<$Res, PenSymbol>;
  @useResult
  $Res call(
      {int id,
      String name,
      double xmin,
      double ymin,
      double xmax,
      double ymax});
}

/// @nodoc
class _$PenSymbolCopyWithImpl<$Res, $Val extends PenSymbol>
    implements $PenSymbolCopyWith<$Res> {
  _$PenSymbolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PenSymbol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      xmin: null == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double,
      ymin: null == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double,
      xmax: null == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double,
      ymax: null == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Pen_SymbolImplCopyWith<$Res>
    implements $PenSymbolCopyWith<$Res> {
  factory _$$Pen_SymbolImplCopyWith(
          _$Pen_SymbolImpl value, $Res Function(_$Pen_SymbolImpl) then) =
      __$$Pen_SymbolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double xmin,
      double ymin,
      double xmax,
      double ymax});
}

/// @nodoc
class __$$Pen_SymbolImplCopyWithImpl<$Res>
    extends _$PenSymbolCopyWithImpl<$Res, _$Pen_SymbolImpl>
    implements _$$Pen_SymbolImplCopyWith<$Res> {
  __$$Pen_SymbolImplCopyWithImpl(
      _$Pen_SymbolImpl _value, $Res Function(_$Pen_SymbolImpl) _then)
      : super(_value, _then);

  /// Create a copy of PenSymbol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
  }) {
    return _then(_$Pen_SymbolImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      xmin: null == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double,
      ymin: null == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double,
      xmax: null == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double,
      ymax: null == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Pen_SymbolImpl implements Pen_Symbol {
  const _$Pen_SymbolImpl(
      {required this.id,
      required this.name,
      required this.xmin,
      required this.ymin,
      required this.xmax,
      required this.ymax});

  factory _$Pen_SymbolImpl.fromJson(Map<String, dynamic> json) =>
      _$$Pen_SymbolImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double xmin;
  @override
  final double ymin;
  @override
  final double xmax;
  @override
  final double ymax;

  @override
  String toString() {
    return 'PenSymbol(id: $id, name: $name, xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Pen_SymbolImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.xmin, xmin) || other.xmin == xmin) &&
            (identical(other.ymin, ymin) || other.ymin == ymin) &&
            (identical(other.xmax, xmax) || other.xmax == xmax) &&
            (identical(other.ymax, ymax) || other.ymax == ymax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, xmin, ymin, xmax, ymax);

  /// Create a copy of PenSymbol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Pen_SymbolImplCopyWith<_$Pen_SymbolImpl> get copyWith =>
      __$$Pen_SymbolImplCopyWithImpl<_$Pen_SymbolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Pen_SymbolImplToJson(
      this,
    );
  }
}

abstract class Pen_Symbol implements PenSymbol {
  const factory Pen_Symbol(
      {required final int id,
      required final String name,
      required final double xmin,
      required final double ymin,
      required final double xmax,
      required final double ymax}) = _$Pen_SymbolImpl;

  factory Pen_Symbol.fromJson(Map<String, dynamic> json) =
      _$Pen_SymbolImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get xmin;
  @override
  double get ymin;
  @override
  double get xmax;
  @override
  double get ymax;

  /// Create a copy of PenSymbol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Pen_SymbolImplCopyWith<_$Pen_SymbolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
