// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:Medikalam/src/models/identity/identifiable.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
class AppointmentResponse extends Identifiable with _$AppointmentResponse {
  const factory AppointmentResponse({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'patient_id') required String patientId,
    @JsonKey(name: 'fullName') required String name,
    @JsonKey(name: 'appt_date') required DateTime apptDate,
    @JsonKey(name: 'appt_time') required String apptTime,
    @JsonKey(name: 'editor_id') String? editorId,
    required DateTime createdAt,
  }) = _AppointmentResponse;

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);
}
