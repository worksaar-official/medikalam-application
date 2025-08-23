// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_pdf_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfGenerationModelImpl _$$PdfGenerationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PdfGenerationModelImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: PdfData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PdfGenerationModelImplToJson(
        _$PdfGenerationModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$PdfDataImpl _$$PdfDataImplFromJson(Map<String, dynamic> json) =>
    _$PdfDataImpl(
      pdfUrl: json['pdfUrl'] as String,
    );

Map<String, dynamic> _$$PdfDataImplToJson(_$PdfDataImpl instance) =>
    <String, dynamic>{
      'pdfUrl': instance.pdfUrl,
    };
