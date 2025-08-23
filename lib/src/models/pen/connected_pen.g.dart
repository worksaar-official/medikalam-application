// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_pen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectedPenImpl _$$ConnectedPenImplFromJson(Map<String, dynamic> json) =>
    _$ConnectedPenImpl(
      macAddress: json['macAddress'] as String,
      deviceName: json['deviceName'] as String,
      batteryLevel: (json['batteryLevel'] as num?)?.toInt(),
      connectedAt: json['connectedAt'] == null
          ? null
          : DateTime.parse(json['connectedAt'] as String),
    );

Map<String, dynamic> _$$ConnectedPenImplToJson(_$ConnectedPenImpl instance) =>
    <String, dynamic>{
      'macAddress': instance.macAddress,
      'deviceName': instance.deviceName,
      'batteryLevel': instance.batteryLevel,
      'connectedAt': instance.connectedAt?.toIso8601String(),
    };
