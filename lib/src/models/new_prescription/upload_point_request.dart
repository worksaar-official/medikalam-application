// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_point_request.freezed.dart';
part 'upload_point_request.g.dart';

@freezed
class UploadPointRequest with _$UploadPointRequest {
  const factory UploadPointRequest({
    required int pageNumber,
    required List<Points> pointsToAdd,
  }) = _UploadPointRequest;

  factory UploadPointRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadPointRequestFromJson(json);
}

@freezed
class Points with _$Points {
  const factory Points(
      {required num x, required num y, required num actionType}) = _Points;

  factory Points.fromJson(Map<String, dynamic> json) => _$PointsFromJson(json);
}
