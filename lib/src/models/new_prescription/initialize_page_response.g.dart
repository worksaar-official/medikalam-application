// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitializePageResponseImpl _$$InitializePageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InitializePageResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: InitializeResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InitializePageResponseImplToJson(
        _$InitializePageResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$InitializeResponseImpl _$$InitializeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$InitializeResponseImpl(
      isNewPage: json['isNewPage'] as bool,
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : PatientResponse.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InitializeResponseImplToJson(
        _$InitializeResponseImpl instance) =>
    <String, dynamic>{
      'isNewPage': instance.isNewPage,
      'page': instance.page,
      'patient': instance.patient,
    };

_$PageImpl _$$PageImplFromJson(Map<String, dynamic> json) => _$PageImpl(
      id: json['_id'] as String,
      hospitalId: json['hospitalId'] as String,
      caseId: json['caseId'] as String,
      creatorId: json['creatorId'] as String,
      doctorId: json['doctorId'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      pageNumber: (json['pageNumber'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      pageType: json['pageType'] as String,
      points: json['points'] as List<dynamic>,
      v: (json['__v'] as num).toInt(),
      hospitalPatientId: json['hospitalPatientId'] as String?,
      mobileNumber: (json['mobileNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PageImplToJson(_$PageImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospitalId': instance.hospitalId,
      'caseId': instance.caseId,
      'creatorId': instance.creatorId,
      'doctorId': instance.doctorId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'pageNumber': instance.pageNumber,
      'width': instance.width,
      'height': instance.height,
      'pageType': instance.pageType,
      'points': instance.points,
      '__v': instance.v,
      'hospitalPatientId': instance.hospitalPatientId,
      'mobileNumber': instance.mobileNumber,
    };
