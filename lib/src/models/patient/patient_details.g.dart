// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientDetailsImpl _$$PatientDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PatientDetailsImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PatientDetailsImplToJson(
        _$PatientDetailsImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      patientDetails:
          PatientInfo.fromJson(json['patientDetails'] as Map<String, dynamic>),
      patientCases: (json['patientCases'] as List<dynamic>)
          .map((e) => PatientCase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'patientDetails': instance.patientDetails,
      'patientCases': instance.patientCases,
    };

_$PatientInfoImpl _$$PatientInfoImplFromJson(Map<String, dynamic> json) =>
    _$PatientInfoImpl(
      id: json['_id'] as String,
      mobileNumber: (json['mobileNumber'] as num).toInt(),
      fullName: json['fullName'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$$PatientInfoImplToJson(_$PatientInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'mobileNumber': instance.mobileNumber,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'age': instance.age,
    };

_$PatientCaseImpl _$$PatientCaseImplFromJson(Map<String, dynamic> json) =>
    _$PatientCaseImpl(
      id: json['_id'] as String,
      hospitalPatientId: json['hospitalPatientId'] as String,
      isOpen: json['isOpen'] as bool? ?? false,
      updatedAt: (json['updatedAt'] as num).toInt(),
      hospitalId: json['hospitalId'] as String,
      doctorId: json['doctorId'] as String,
      creatorId: json['creatorId'] as String,
      pageCount: (json['pageCount'] as num).toInt(),
      createdAt: (json['createdAt'] as num).toInt(),
      pageNumbers: (json['pageNumbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      additionals: (json['additionals'] as List<dynamic>)
          .map((e) => Additional.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$PatientCaseImplToJson(_$PatientCaseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospitalPatientId': instance.hospitalPatientId,
      'isOpen': instance.isOpen,
      'updatedAt': instance.updatedAt,
      'hospitalId': instance.hospitalId,
      'doctorId': instance.doctorId,
      'creatorId': instance.creatorId,
      'pageCount': instance.pageCount,
      'createdAt': instance.createdAt,
      'pageNumbers': instance.pageNumbers,
      'additionals': instance.additionals,
      '__v': instance.v,
    };

_$AdditionalImpl _$$AdditionalImplFromJson(Map<String, dynamic> json) =>
    _$AdditionalImpl(
      publicUrl: json['public_url'] as String,
      details: Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdditionalImplToJson(_$AdditionalImpl instance) =>
    <String, dynamic>{
      'public_url': instance.publicUrl,
      'details': instance.details,
    };

_$DetailsImpl _$$DetailsImplFromJson(Map<String, dynamic> json) =>
    _$DetailsImpl(
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$DetailsImplToJson(_$DetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
