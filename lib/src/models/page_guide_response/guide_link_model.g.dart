// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuideLinkModelImpl _$$GuideLinkModelImplFromJson(Map<String, dynamic> json) =>
    _$GuideLinkModelImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GuideLinkModelImplToJson(
        _$GuideLinkModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      updatedCase:
          UpdatedCase.fromJson(json['updatedCase'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'updatedCase': instance.updatedCase,
    };

_$UpdatedCaseImpl _$$UpdatedCaseImplFromJson(Map<String, dynamic> json) =>
    _$UpdatedCaseImpl(
      pdf: Pdf.fromJson(json['pdf'] as Map<String, dynamic>),
      pdfTask: PdfTask.fromJson(json['pdfTask'] as Map<String, dynamic>),
      id: json['_id'] as String,
      updatedAt: (json['updatedAt'] as num).toInt(),
      hospitalId: json['hospitalId'] as String,
      doctorId: json['doctorId'] as String,
      creatorId: json['creatorId'] as String,
      pageCount: (json['pageCount'] as num).toInt(),
      createdAt: (json['createdAt'] as num).toInt(),
      pageNumbers: (json['pageNumbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      additionals: (json['additionals'] as List<dynamic>)
          .map((e) => Additional.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: (json['__v'] as num).toInt(),
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      gender: json['gender'] as String,
      hospitalPatientId: json['hospitalPatientId'] as String,
      mobileNumber: (json['mobileNumber'] as num).toInt(),
    );

Map<String, dynamic> _$$UpdatedCaseImplToJson(_$UpdatedCaseImpl instance) =>
    <String, dynamic>{
      'pdf': instance.pdf,
      'pdfTask': instance.pdfTask,
      '_id': instance.id,
      'updatedAt': instance.updatedAt,
      'hospitalId': instance.hospitalId,
      'doctorId': instance.doctorId,
      'creatorId': instance.creatorId,
      'pageCount': instance.pageCount,
      'createdAt': instance.createdAt,
      'pageNumbers': instance.pageNumbers,
      'additionals': instance.additionals,
      '__v': instance.v,
      'email': instance.email,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'hospitalPatientId': instance.hospitalPatientId,
      'mobileNumber': instance.mobileNumber,
    };

_$PdfImpl _$$PdfImplFromJson(Map<String, dynamic> json) => _$PdfImpl(
      publicUrl: json['publicUrl'] as String,
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$$PdfImplToJson(_$PdfImpl instance) => <String, dynamic>{
      'publicUrl': instance.publicUrl,
      'updatedAt': instance.updatedAt,
    };

_$PdfTaskImpl _$$PdfTaskImplFromJson(Map<String, dynamic> json) =>
    _$PdfTaskImpl(
      jobId: json['jobId'] as String,
      status: json['status'] as String,
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$$PdfTaskImplToJson(_$PdfTaskImpl instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
    };

_$AdditionalImpl _$$AdditionalImplFromJson(Map<String, dynamic> json) =>
    _$AdditionalImpl(
      publicUrl: json['publicUrl'] as String,
      metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdditionalImplToJson(_$AdditionalImpl instance) =>
    <String, dynamic>{
      'publicUrl': instance.publicUrl,
      'metaData': instance.metaData,
      'details': instance.details,
    };

_$MetaDataImpl _$$MetaDataImplFromJson(Map<String, dynamic> json) =>
    _$MetaDataImpl(
      type: json['type'] as String,
      mime: json['mime'] as String,
      uploader: json['uploader'] as String,
      uploadedAt: (json['uploadedAt'] as num).toInt(),
      ext: json['ext'] as String?,
    );

Map<String, dynamic> _$$MetaDataImplToJson(_$MetaDataImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mime': instance.mime,
      'uploader': instance.uploader,
      'uploadedAt': instance.uploadedAt,
      'ext': instance.ext,
    };

_$DetailsImpl _$$DetailsImplFromJson(Map<String, dynamic> json) =>
    _$DetailsImpl(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$DetailsImplToJson(_$DetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
