// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pen_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PenEventImpl _$$PenEventImplFromJson(Map<String, dynamic> json) =>
    _$PenEventImpl(
      macAddress: json['STRING_PEN_MAC_ADDRESS'] as String,
      deviceName: json['STRING_DEVICE_NAME'] as String,
      rssi: (json['STRING_DEVICE_RSSI'] as num).toInt(),
      advData: json['STRING_DEVICE_ADVDATA'],
      penMsgType: (json['penMsgType'] as num).toInt(),
    );

Map<String, dynamic> _$$PenEventImplToJson(_$PenEventImpl instance) =>
    <String, dynamic>{
      'STRING_PEN_MAC_ADDRESS': instance.macAddress,
      'STRING_DEVICE_NAME': instance.deviceName,
      'STRING_DEVICE_RSSI': instance.rssi,
      'STRING_DEVICE_ADVDATA': instance.advData,
      'penMsgType': instance.penMsgType,
    };
