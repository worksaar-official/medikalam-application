// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:Medikalam/src/models/view_case/view_case_response.dart';

part 'dash_response.freezed.dart';
part 'dash_response.g.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    @Default("Hello") String greeting,
    required StaffDetails staffDetails,
    required Analytics analytics,
  }) = _DashboardData;

  factory DashboardData.empty() => DashboardData(
        greeting: 'Hello', // Default greeting
        staffDetails:
            StaffDetails.empty(), // Use the empty constructor of StaffDetails
        analytics: Analytics.empty(), // Use the empty constructor of Analytics
      );

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}

@freezed
class StaffDetails with _$StaffDetails {
  const factory StaffDetails({
    required Hospital hospital,
    @JsonKey(name: "_id") required String id,
    required String fullName,
    required String title,
  }) = _StaffDetails;

  factory StaffDetails.empty() => StaffDetails(
        hospital: Hospital.empty(), // Use the empty constructor of Hospital
        id: 'N/A',
        fullName: 'Unknown',
        title: 'Unknown',
      );

  factory StaffDetails.fromJson(Map<String, dynamic> json) =>
      _$StaffDetailsFromJson(json);
}

@freezed
class Analytics with _$Analytics {
  const factory Analytics({
    required Total total,
    required TodaySoFar todaySoFar,
  }) = _Analytics;

  factory Analytics.empty() => Analytics(
        total: Total.empty(), // Use the empty constructor of Total
        todaySoFar:
            TodaySoFar.empty(), // Use the empty constructor of TodaySoFar
      );

  factory Analytics.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsFromJson(json);
}

@freezed
class Total with _$Total {
  const factory Total({
    required int count,
    required int male,
    required int female,
  }) = _Total;

  factory Total.empty() => const Total(
        count: 0,
        male: 0,
        female: 0,
      );

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);
}

@freezed
class TodaySoFar with _$TodaySoFar {
  const factory TodaySoFar({
    required int count,
    required int male,
    required int female,
  }) = _TodaySoFar;

  factory TodaySoFar.empty() => const TodaySoFar(
        count: 0,
        male: 0,
        female: 0,
      );

  factory TodaySoFar.fromJson(Map<String, dynamic> json) =>
      _$TodaySoFarFromJson(json);
}
