// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_prescription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescriptionModelImpl _$$PrescriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrescriptionModelImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: PrescriptionData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PrescriptionModelImplToJson(
        _$PrescriptionModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$PrescriptionDataImpl _$$PrescriptionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PrescriptionDataImpl(
      jobId: json['jobId'] as String,
      queueLength: (json['queueLength'] as num).toInt(),
      expectedTime: (json['expectedTime'] as num).toInt(),
    );

Map<String, dynamic> _$$PrescriptionDataImplToJson(
        _$PrescriptionDataImpl instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'queueLength': instance.queueLength,
      'expectedTime': instance.expectedTime,
    };
