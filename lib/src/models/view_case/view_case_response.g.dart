// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_case_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewCaseModelImpl _$$ViewCaseModelImplFromJson(Map<String, dynamic> json) =>
    _$ViewCaseModelImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ViewCaseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewCaseModelImplToJson(_$ViewCaseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ViewCaseDataImpl _$$ViewCaseDataImplFromJson(Map<String, dynamic> json) =>
    _$ViewCaseDataImpl(
      title: json['title'] as String,
      id: json['_id'] as String,
      updatedAt: json['updatedAt'] as String,
      diagnosis: json['diagnosis'] as String,
      patient: Patient.fromJson(json['patient'] as Map<String, dynamic>),
      documents: (json['documents'] as List<dynamic>)
          .map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      doctor: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      pageNumbers: (json['pageNumbers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      shareRequired: json['shareRequired'] as bool,
      additionals: json['additionals'] as List<dynamic>,
    );

Map<String, dynamic> _$$ViewCaseDataImplToJson(_$ViewCaseDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      '_id': instance.id,
      'updatedAt': instance.updatedAt,
      'diagnosis': instance.diagnosis,
      'patient': instance.patient,
      'documents': instance.documents,
      'doctor': instance.doctor,
      'pageNumbers': instance.pageNumbers,
      'shareRequired': instance.shareRequired,
      'additionals': instance.additionals,
    };

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      name: json['name'] as String,
      mobileNumber: (json['mobileNumber'] as num).toInt(),
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'gender': instance.gender,
    };

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      title: json['title'] as String,
      type: json['type'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      displayPicture: json['displayPicture'] as String,
      hospital: Hospital.fromJson(json['hospital'] as Map<String, dynamic>),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayPicture': instance.displayPicture,
      'hospital': instance.hospital,
      'title': instance.title,
    };

_$HospitalImpl _$$HospitalImplFromJson(Map<String, dynamic> json) =>
    _$HospitalImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$HospitalImplToJson(_$HospitalImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
