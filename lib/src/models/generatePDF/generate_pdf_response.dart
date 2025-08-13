// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_pdf_response.freezed.dart';
part 'generate_pdf_response.g.dart';

@freezed
class PdfGenerationModel with _$PdfGenerationModel {
  const factory PdfGenerationModel({
    required bool success,
    required String message,
    required PdfData data,
  }) = _PdfGenerationModel;

  factory PdfGenerationModel.fromJson(Map<String, dynamic> json) =>
      _$PdfGenerationModelFromJson(json);
}

@freezed
class PdfData with _$PdfData {
  const factory PdfData({
    required String pdfUrl,
  }) = _PdfData;

  factory PdfData.fromJson(Map<String, dynamic> json) =>
      _$PdfDataFromJson(json);
}
