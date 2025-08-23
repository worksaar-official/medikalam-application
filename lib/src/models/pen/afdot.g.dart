// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afdot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AfdotImpl _$$AfdotImplFromJson(Map<String, dynamic> json) => _$AfdotImpl(
      type: json['type'] as num,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      page: json['page'] as num,
      bookNo: json['book_no'] as num,
      bookWidth: json['book_width'] as num,
      bookHeight: json['book_height'] as num,
      reserved1: json['reserved1'] as num,
    );

Map<String, dynamic> _$$AfdotImplToJson(_$AfdotImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'x': instance.x,
      'y': instance.y,
      'page': instance.page,
      'book_no': instance.bookNo,
      'book_width': instance.bookWidth,
      'book_height': instance.bookHeight,
      'reserved1': instance.reserved1,
    };
