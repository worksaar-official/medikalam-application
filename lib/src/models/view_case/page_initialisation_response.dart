// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:Medikalam/src/models/page_details/page_details_response.dart';

part 'page_initialisation_response.freezed.dart';
part 'page_initialisation_response.g.dart';

@freezed
class PageInitialisationResponse with _$PageInitialisationResponse {
  const factory PageInitialisationResponse({
    required bool success,
    required String message,
    required PageData data,
  }) = _PageInitialisationResponse;

  factory PageInitialisationResponse.fromJson(Map<String, dynamic> json) =>
      _$PageInitialisationResponseFromJson(json);
}

@freezed
class PageData with _$PageData {
  const factory PageData({
    @Default(false) bool isNewPage,
    required Page page,
  }) = _PageData;

  factory PageData.fromJson(Map<String, dynamic> json) =>
      _$PageDataFromJson(json);
}

@freezed
class Page with _$Page {
  const factory Page({
    required String id,
    required String hospitalId,
    required String caseId,
    required String creatorId,
    required String doctorId,
    required int createdAt,
    required int updatedAt,
    required int pageNumber,
    required int width,
    required int height,
    required String pageType,
    required List<Point> points,
  }) = _Page;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

