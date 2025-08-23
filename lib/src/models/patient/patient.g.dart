// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientResponseImpl _$$PatientResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PatientResponseImpl(
      id: json['_id'] as String,
      mobileNumber: (json['mobileNumber'] as num).toInt(),
      fullName: json['fullName'] as String,
      gender: json['gender'] as String,
      updatedAt: (json['updatedAt'] as num).toInt(),
      age: (json['age'] as num?)?.toInt() ?? 0,
      createdAt: (json['createdAt'] as num).toInt(),
      hospitalId: json['hospitalId'] as String,
      creatorId: json['creatorId'] as String,
      searchIndex: json['searchIndex'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$$PatientResponseImplToJson(
        _$PatientResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'mobileNumber': instance.mobileNumber,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'updatedAt': instance.updatedAt,
      'age': instance.age,
      'createdAt': instance.createdAt,
      'hospitalId': instance.hospitalId,
      'creatorId': instance.creatorId,
      'searchIndex': instance.searchIndex,
      '__v': instance.v,
    };
