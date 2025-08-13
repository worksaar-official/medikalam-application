// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_response.freezed.dart';
part 'media_response.g.dart';

@freezed
class MediaResponse with _$MediaResponse {
  const factory MediaResponse({
    required String publicUrl,
    required String publicId,
    required String mediaType,
    required String id,
  }) = _MediaResponse;

  factory MediaResponse.fromJson(Map<String, dynamic> json) => _$MediaResponseFromJson(json);
}
