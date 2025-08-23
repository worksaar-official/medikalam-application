// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      greeting: json['greeting'] as String? ?? "Hello",
      staffDetails:
          StaffDetails.fromJson(json['staffDetails'] as Map<String, dynamic>),
      analytics: Analytics.fromJson(json['analytics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'greeting': instance.greeting,
      'staffDetails': instance.staffDetails,
      'analytics': instance.analytics,
    };

_$StaffDetailsImpl _$$StaffDetailsImplFromJson(Map<String, dynamic> json) =>
    _$StaffDetailsImpl(
      hospital: Hospital.fromJson(json['hospital'] as Map<String, dynamic>),
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$StaffDetailsImplToJson(_$StaffDetailsImpl instance) =>
    <String, dynamic>{
      'hospital': instance.hospital,
      '_id': instance.id,
      'fullName': instance.fullName,
      'title': instance.title,
    };

_$AnalyticsImpl _$$AnalyticsImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsImpl(
      total: Total.fromJson(json['total'] as Map<String, dynamic>),
      todaySoFar:
          TodaySoFar.fromJson(json['todaySoFar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnalyticsImplToJson(_$AnalyticsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'todaySoFar': instance.todaySoFar,
    };

_$TotalImpl _$$TotalImplFromJson(Map<String, dynamic> json) => _$TotalImpl(
      count: (json['count'] as num).toInt(),
      male: (json['male'] as num).toInt(),
      female: (json['female'] as num).toInt(),
    );

Map<String, dynamic> _$$TotalImplToJson(_$TotalImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'male': instance.male,
      'female': instance.female,
    };

_$TodaySoFarImpl _$$TodaySoFarImplFromJson(Map<String, dynamic> json) =>
    _$TodaySoFarImpl(
      count: (json['count'] as num).toInt(),
      male: (json['male'] as num).toInt(),
      female: (json['female'] as num).toInt(),
    );

Map<String, dynamic> _$$TodaySoFarImplToJson(_$TodaySoFarImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'male': instance.male,
      'female': instance.female,
    };
