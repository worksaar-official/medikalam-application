// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_initialisation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageInitialisationResponseImpl _$$PageInitialisationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PageInitialisationResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: PageData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PageInitialisationResponseImplToJson(
        _$PageInitialisationResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$PageDataImpl _$$PageDataImplFromJson(Map<String, dynamic> json) =>
    _$PageDataImpl(
      isNewPage: json['isNewPage'] as bool? ?? false,
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PageDataImplToJson(_$PageDataImpl instance) =>
    <String, dynamic>{
      'isNewPage': instance.isNewPage,
      'page': instance.page,
    };

_$PageImpl _$$PageImplFromJson(Map<String, dynamic> json) => _$PageImpl(
      id: json['id'] as String,
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
      points: (json['points'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PageImplToJson(_$PageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
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
    };
