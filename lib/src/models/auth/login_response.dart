// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool success,
    required String message,
    required LoginData? data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    required String jwt,
    required int expiresAt,
    required String uid,
    required User user,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required bool success,
    required String message,
    required User data,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

// TODO: cross check the fields we receive from server api
@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') String? id,
    required String fullName,
    required String firstName,
    required String lastName,
    required int mobileNumber,
    required String email,
    required String displayPicture,
    required String type,
    required String title,
    @JsonKey(name: 'hospital') required Hospital hospital,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    @JsonKey(name: '_id') String? id,
    required String name,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) => _$HospitalFromJson(json);
}
