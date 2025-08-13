// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol.freezed.dart';
part 'symbol.g.dart'; // If you need JSON serialization

@freezed
class PenSymbol with _$PenSymbol {
  const factory PenSymbol({
    required int id,
    required String name,
    required double xmin,
    required double ymin,
    required double xmax,
    required double ymax,
  }) = Pen_Symbol;

  factory PenSymbol.fromJson(Map<String, dynamic> json) => _$PenSymbolFromJson(json);
}
