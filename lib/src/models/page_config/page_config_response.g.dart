// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageConfigResponseImpl _$$PageConfigResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PageConfigResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PageConfigResponseImplToJson(
        _$PageConfigResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      guides: (json['guides'] as List<dynamic>)
          .map((e) => Guide.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageDetails:
          PageDetails.fromJson(json['pageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'guides': instance.guides,
      'pageDetails': instance.pageDetails,
    };

_$GuideImpl _$$GuideImplFromJson(Map<String, dynamic> json) => _$GuideImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      hospitalId: json['hospitalId'] as String,
      doctorId: json['doctorId'] as String,
      description: json['description'] as String,
      position: (json['position'] as num).toInt(),
      url: json['url'] as String,
      type: json['type'] as String,
      mime: json['mime'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$GuideImplToJson(_$GuideImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'hospitalId': instance.hospitalId,
      'doctorId': instance.doctorId,
      'description': instance.description,
      'position': instance.position,
      'url': instance.url,
      'type': instance.type,
      'mime': instance.mime,
      '__v': instance.v,
    };

_$PageDetailsImpl _$$PageDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PageDetailsImpl(
      pageHeight: (json['pageHeight'] as num).toInt(),
      pageWidth: (json['pageWidth'] as num).toInt(),
      pageBackground: json['pageBackground'] as String,
      configUrl: json['configUrl'] as String,
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      points: (json['points'] as List<dynamic>?)
          ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PageDetailsImplToJson(_$PageDetailsImpl instance) =>
    <String, dynamic>{
      'pageHeight': instance.pageHeight,
      'pageWidth': instance.pageWidth,
      'pageBackground': instance.pageBackground,
      'configUrl': instance.configUrl,
      'pageNumber': instance.pageNumber,
      'points': instance.points,
      'height': instance.height,
      'width': instance.width,
      '__v': instance.v,
    };
