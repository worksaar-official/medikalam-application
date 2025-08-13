// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide_link_model.freezed.dart';
part 'guide_link_model.g.dart';

@freezed
class GuideLinkModel with _$GuideLinkModel {
  const factory GuideLinkModel({
    required bool success,
    required String message,
    required Data data,
  }) = _GuideLinkModel;

  factory GuideLinkModel.fromJson(Map<String, dynamic> json) =>
      _$GuideLinkModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required UpdatedCase updatedCase,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class UpdatedCase with _$UpdatedCase {
  const factory UpdatedCase({
    required Pdf pdf,
    required PdfTask pdfTask,
    @JsonKey(name: '_id') required String id,
    required int updatedAt,
    required String hospitalId,
    required String doctorId,
    required String creatorId,
    required int pageCount,
    required int createdAt,
    required List<int> pageNumbers,
    required List<Additional> additionals,
    @JsonKey(name: '__v') required int v,
    required String email,
    required String fullName,
    required String gender,
    required String hospitalPatientId,
    required int mobileNumber,
  }) = _UpdatedCase;

  factory UpdatedCase.fromJson(Map<String, dynamic> json) =>
      _$UpdatedCaseFromJson(json);
}

@freezed
class Pdf with _$Pdf {
  const factory Pdf({
    required String publicUrl,
    required int updatedAt,
  }) = _Pdf;

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);
}

@freezed
class PdfTask with _$PdfTask {
  const factory PdfTask({
    required String jobId,
    required String status,
    required int updatedAt,
  }) = _PdfTask;

  factory PdfTask.fromJson(Map<String, dynamic> json) =>
      _$PdfTaskFromJson(json);
}

@freezed
class Additional with _$Additional {
  const factory Additional({
    required String publicUrl,
    required MetaData metaData,
    required Details details,
  }) = _Additional;

  factory Additional.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFromJson(json);
}

@freezed
class MetaData with _$MetaData {
  const factory MetaData({
    required String type,
    required String mime,
    required String uploader,
    required int uploadedAt,
    String? ext,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    required String name,
    required String description,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}
