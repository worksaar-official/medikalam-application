// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_details.freezed.dart';
part 'patient_details.g.dart';

@freezed
class PatientDetails with _$PatientDetails {
  const factory PatientDetails({
    required bool success,
    required String message,
    required Data data,
  }) = _PatientDetails;
  factory PatientDetails.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailsFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required List<PatientCase> patientCases,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class PatientCase with _$PatientCase {
  const factory PatientCase({
    @JsonKey(name: '_id') required String id,
    required String hospitalPatientId,
    @Default(false)  bool isOpen,
    required int mobileNumber,
    required int updatedAt,
    required String hospitalId,
    required String fullName,
    required String gender,
    required String doctorId,
    required String creatorId,
    required int pageCount,
    required int createdAt,
    required List<int> pageNumbers,
    required List<Additional> additionals,
    @JsonKey(name: '__v') required int v,
  }) = _PatientCase;

  factory PatientCase.fromJson(Map<String, dynamic> json) =>
      _$PatientCaseFromJson(json);
}

@freezed
class Additional with _$Additional {
  const factory Additional({
    @JsonKey(name: 'public_url') required String publicUrl,
    required Details details,
  }) = _Additional;

  factory Additional.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    required String name,
    required String description,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}
