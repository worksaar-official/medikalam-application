// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentResponseImpl _$$AppointmentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentResponseImpl(
      id: json['_id'] as String,
      patientId: json['patient_id'] as String,
      name: json['fullName'] as String,
      apptDate: DateTime.parse(json['appt_date'] as String),
      apptTime: json['appt_time'] as String,
      editorId: json['editor_id'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AppointmentResponseImplToJson(
        _$AppointmentResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'patient_id': instance.patientId,
      'fullName': instance.name,
      'appt_date': instance.apptDate.toIso8601String(),
      'appt_time': instance.apptTime,
      'editor_id': instance.editorId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
