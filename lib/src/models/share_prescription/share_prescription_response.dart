// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_prescription_response.freezed.dart';
part 'share_prescription_response.g.dart';

@freezed
class PrescriptionModel with _$PrescriptionModel {
  const factory PrescriptionModel({
    required bool success,
    required String message,
    required PrescriptionData data,
  }) = _PrescriptionModel;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionModelFromJson(json);
}

@freezed
class PrescriptionData with _$PrescriptionData {
  const factory PrescriptionData({
    required String jobId,
    required int queueLength,
    required int expectedTime,
  }) = _PrescriptionData;

  factory PrescriptionData.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionDataFromJson(json);
}
