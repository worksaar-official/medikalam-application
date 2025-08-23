// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_point_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadPointRequestImpl _$$UploadPointRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadPointRequestImpl(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pointsToAdd: (json['pointsToAdd'] as List<dynamic>)
          .map((e) => Points.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UploadPointRequestImplToJson(
        _$UploadPointRequestImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pointsToAdd': instance.pointsToAdd,
    };

_$PointsImpl _$$PointsImplFromJson(Map<String, dynamic> json) => _$PointsImpl(
      x: json['x'] as num,
      y: json['y'] as num,
      actionType: json['actionType'] as num,
    );

Map<String, dynamic> _$$PointsImplToJson(_$PointsImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'actionType': instance.actionType,
    };
