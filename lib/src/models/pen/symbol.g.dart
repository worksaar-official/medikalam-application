// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Pen_SymbolImpl _$$Pen_SymbolImplFromJson(Map<String, dynamic> json) =>
    _$Pen_SymbolImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      xmin: (json['xmin'] as num).toDouble(),
      ymin: (json['ymin'] as num).toDouble(),
      xmax: (json['xmax'] as num).toDouble(),
      ymax: (json['ymax'] as num).toDouble(),
    );

Map<String, dynamic> _$$Pen_SymbolImplToJson(_$Pen_SymbolImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'xmin': instance.xmin,
      'ymin': instance.ymin,
      'xmax': instance.xmax,
      'ymax': instance.ymax,
    };
