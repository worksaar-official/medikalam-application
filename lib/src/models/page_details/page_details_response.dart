// Package imports:

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_details_response.freezed.dart';
part 'page_details_response.g.dart';

@freezed
class PageDetailsResponse with _$PageDetailsResponse {
  const factory PageDetailsResponse({
    bool? success,
    String? message,
    PageDetailsResponseData? data,
  }) = _PageDetailsResponse;

  factory PageDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PageDetailsResponseFromJson(json);
}

@freezed
class PageDetailsResponseData with _$PageDetailsResponseData {
  const factory PageDetailsResponseData({
    @JsonKey(name: "_id") required String id,
    required String creatorId,
    required String doctorId,
    required int createdAt,
    required int updatedAt,
    required int pageNumber,
    required int width,
    required int height,
    required String pageType,
    required List<Point> points,
    @JsonKey(name: '__v') required int v,
  }) = _PageDetailsResponseData;

  factory PageDetailsResponseData.fromJson(Map<String, dynamic> json) =>
      _$PageDetailsResponseDataFromJson(json);
}

@freezed
class Point with _$Point {
  const factory Point({
    required int x,
    required int y,
    @JsonKey(name: 'actionType') required int actionType,
    @JsonKey(name: '_id') String? id,
  }) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
