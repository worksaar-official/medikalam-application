// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_case_response.freezed.dart';
part 'view_case_response.g.dart';

@freezed
class ViewCaseModel with _$ViewCaseModel {
  const factory ViewCaseModel({
    bool? success,
    String? message,
    ViewCaseData? data,
  }) = _ViewCaseModel;

  factory ViewCaseModel.fromJson(Map<String, dynamic> json) =>
      _$ViewCaseModelFromJson(json);
}

@freezed
class ViewCaseData with _$ViewCaseData {
  const factory ViewCaseData({
    required String title,
    @JsonKey(name: '_id') required String id,
    required String updatedAt,
    required String diagnosis,
    required Patient patient,
    required List<Document> documents,
    required Doctor doctor,
    required List<int> pageNumbers,
    required bool shareRequired,
    required List<dynamic> additionals,
  }) = _ViewCaseData;

  factory ViewCaseData.empty() => ViewCaseData(
        title: 'Unknown',
        id: 'N/A',
        updatedAt: DateTime.now().toIso8601String(),
        diagnosis: 'N/A',
        patient: Patient.empty(), // Use the empty constructor of Patient
        documents: [],
        doctor: Doctor.empty(), // Add an empty constructor for Doctor
        pageNumbers: [],
        shareRequired: false,
        additionals: [],
      );

  factory ViewCaseData.fromJson(Map<String, dynamic> json) =>
      _$ViewCaseDataFromJson(json);
}

@freezed
class Patient with _$Patient {
  const factory Patient({
    required String name,
    required int mobileNumber,
    required String gender,
  }) = _Patient;

  factory Patient.empty() => const Patient(
        name: 'Unknown',
        mobileNumber: 0,
        gender: 'Unknown',
      );

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

@freezed
class Document with _$Document {
  const factory Document({
    required String title,
    required String type,
    required String? url,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String displayPicture,
    required Hospital hospital,
    required String title,
  }) = _Doctor;

  factory Doctor.empty() => Doctor(
        id: 'N/A',
        name: 'Unknown',
        displayPicture: 'default.png', // Or a placeholder image
        hospital: Hospital.empty(), // Use the empty constructor for Hospital
        title: 'N/A',
      );

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    @JsonKey(name: '_id') required String id,
    required String name,
  }) = _Hospital;

  factory Hospital.empty() => const Hospital(
        id: 'N/A',
        name: 'Unknown Hospital',
      );

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
}
