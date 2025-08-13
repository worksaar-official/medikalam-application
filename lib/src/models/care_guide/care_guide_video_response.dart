// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'care_guide_video_response.freezed.dart';
part 'care_guide_video_response.g.dart';

@freezed
class CareGuideVideoResponse with _$CareGuideVideoResponse {
  const factory CareGuideVideoResponse({
    @JsonKey(name: '_id')
    required String id,
    required String name,
    required String hospitalId,
    required String doctorId,
    required String description,
    required int position,
    required String url,
    required String type,
    required String mime,
  }) = _CareGuideVideoResponse;

  factory CareGuideVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$CareGuideVideoResponseFromJson(json);
}
