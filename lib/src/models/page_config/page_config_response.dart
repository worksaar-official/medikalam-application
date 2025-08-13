// Package imports:

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:Medikalam/src/models/page_details/page_details_response.dart';

part 'page_config_response.freezed.dart';
part 'page_config_response.g.dart';

@freezed
class PageConfigResponse with _$PageConfigResponse {
  const factory PageConfigResponse({
    required bool success,
    required String message,
    required Data data,
  }) = _PageConfigResponse;

  factory PageConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$PageConfigResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required List<Guide> guides,
    required PageDetails pageDetails,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Guide with _$Guide {
  const factory Guide({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String hospitalId,
    required String doctorId,
    required String description,
    required int position,
    required String url,
    required String type,
    required String mime,
    @JsonKey(name: '__v') required int v,
  }) = _Guide;

  factory Guide.fromJson(Map<String, dynamic> json) => _$GuideFromJson(json);
}

@freezed
class PageDetails with _$PageDetails {
  const factory PageDetails(
      {required int pageHeight,
      required int pageWidth,
      required String pageBackground,
      required String configUrl,
      int? pageNumber,
      List<Point>? points,
      int? height,
      int? width,
      @JsonKey(name: "__v") int? v}) = _PageDetails;

  factory PageDetails.empty() => const PageDetails(
      pageHeight: 0, pageWidth: 0, pageBackground: '', configUrl: '');

  factory PageDetails.fromJson(Map<String, dynamic> json) =>
      _$PageDetailsFromJson(json);
}
