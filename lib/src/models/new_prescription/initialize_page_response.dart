// Package imports:

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:Medikalam/src/models/patient/patient.dart';

part 'initialize_page_response.freezed.dart';
part 'initialize_page_response.g.dart';

@freezed
class InitializePageResponse with _$InitializePageResponse {
  const factory InitializePageResponse({
    required bool success,
    required String message,
    required InitializeResponse data,
  }) = _InitializePageResponse;

  factory InitializePageResponse.fromJson(Map<String, dynamic> json) =>
      _$InitializePageResponseFromJson(json);
}

@freezed
class InitializeResponse with _$InitializeResponse {
  const factory InitializeResponse({
    required bool isNewPage,
    required Page page,
    PatientResponse? patient,
  }) = _InitializeResponse;

  factory InitializeResponse.empty() => InitializeResponse(
        isNewPage: false,
        page: Page.empty(), // Assuming Page has an empty constructor too
        patient: null, // Optional field initialized to null
      );

  factory InitializeResponse.fromJson(Map<String, dynamic> json) =>
      _$InitializeResponseFromJson(json);
}

@freezed
class Page with _$Page {
  const factory Page({
    @JsonKey(name: '_id') required String id,
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
    required List<dynamic> points,
    @JsonKey(name: '__v') required int v,
    String? hospitalPatientId,
    int? mobileNumber,
  }) = _Page;

  factory Page.empty() => const Page(
        id: '',
        hospitalId: '',
        caseId: '',
        creatorId: '',
        doctorId: '',
        createdAt: 0,
        updatedAt: 0,
        pageNumber: 0,
        width: 0,
        height: 0,
        pageType: '',
        points: [],
        v: 0,
        hospitalPatientId: null,
        mobileNumber: null,
      );

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}
