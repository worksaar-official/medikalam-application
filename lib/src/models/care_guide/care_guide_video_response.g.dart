// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_guide_video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CareGuideVideoResponseImpl _$$CareGuideVideoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CareGuideVideoResponseImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      hospitalId: json['hospitalId'] as String,
      doctorId: json['doctorId'] as String,
      description: json['description'] as String,
      position: (json['position'] as num).toInt(),
      url: json['url'] as String,
      type: json['type'] as String,
      mime: json['mime'] as String,
    );

Map<String, dynamic> _$$CareGuideVideoResponseImplToJson(
        _$CareGuideVideoResponseImpl instance) =>
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
    };
