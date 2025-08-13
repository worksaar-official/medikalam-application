// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'afdot.freezed.dart';
part 'afdot.g.dart';

@freezed
class Afdot with _$Afdot {
  const factory Afdot({
    required num type,
    required double x,
    required double y,
    required num page,
    @JsonKey(name: 'book_no') required num bookNo,
    @JsonKey(name: 'book_width') required num bookWidth,
    @JsonKey(name: 'book_height') required num bookHeight,
    required num reserved1,
  }) = _Afdot;

  factory Afdot.fromJson(Map<String, dynamic> json) => _$AfdotFromJson(json);
}
