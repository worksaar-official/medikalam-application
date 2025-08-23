// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageDetailsResponseImpl _$$PageDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PageDetailsResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : PageDetailsResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PageDetailsResponseImplToJson(
        _$PageDetailsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$PageDetailsResponseDataImpl _$$PageDetailsResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PageDetailsResponseDataImpl(
      id: json['_id'] as String,
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
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$PageDetailsResponseDataImplToJson(
        _$PageDetailsResponseDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
    };

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      actionType: (json['actionType'] as num).toInt(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'actionType': instance.actionType,
      '_id': instance.id,
    };
