// Package imports:

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:Medikalam/src/models/identity/identifiable.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class PatientResponse extends Identifiable with _$PatientResponse {
  const factory PatientResponse({
    @JsonKey(name: '_id') required String id,
    required int mobileNumber,
    required String fullName,
    required String gender,
    required int updatedAt,
    @JsonKey(defaultValue: 0) required int age,
    required int createdAt,
    required String hospitalId,
    required String creatorId,
    required String searchIndex,
    @JsonKey(name: '__v') required int v,
  }) = _PatientResponse;

  factory PatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseFromJson(json);

  factory PatientResponse.empty() => const PatientResponse(
        id: '',
        mobileNumber: 0,
        fullName: '',
        gender: '',
        updatedAt: 0,
        age: 0,
        createdAt: 0,
        hospitalId: '',
        creatorId: '',
        searchIndex: '',
        v: 0,
      );
}
