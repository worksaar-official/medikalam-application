// Package imports:

// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/prescription/prescription_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/media/media_response.dart';
import 'package:Medikalam/src/models/new_prescription/initialize_page_response.dart';
import 'package:Medikalam/src/models/new_prescription/upload_point_request.dart';
import 'package:Medikalam/src/models/patient/patient.dart';

@LazySingleton(as: PrescriptionRepo)
class PrescriptionRepoImpl implements PrescriptionRepo {
  @override
  Future<ApiResult<InitializePageResponse>> initialisePage(
      int pageNumber) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.initializePage,
        data: {'pageNumber': pageNumber},
      );
      if (response != null && response['success'] == true) {
        return ApiResult.success(
            data: InitializePageResponse.fromJson(response));
      }
      return ApiResult.failure(
        error: ServerException(message: response?["message"]),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<MediaResponse>> uploadMedia(String pageId,File mediaFile) async {
    try {
      final formData = FormData.fromMap({
        'pageId': pageId,
        'mediaFile': await MultipartFile.fromFile(
          mediaFile.path,
          filename: mediaFile.path.split('/').last,
        ),
      });

      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.uploadMedia,
        data: formData,
      );
      if (response != null && response['success'] == true) {
        return ApiResult.success(
          data: MediaResponse.fromJson(response['data']),
        );
      }
      return ApiResult.failure(
        error: ServerException(message: response?["message"]),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    } catch (e) {
      return ApiResult.failure(
        error: ServerException(message: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<InitializePageResponse>> scanQr(int pageNumber) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.initializePageQr,
        data: {
          "qrData": jsonEncode({"pageNumber": pageNumber}),
        },
      );
      if (response != null && response['success'] == true) {
        return ApiResult.success(
            data: InitializePageResponse.fromJson(response));
      }
      return ApiResult.failure(
        error: ServerException(message: response?["message"]),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<PatientResponse>> linkPage(Map<String, dynamic> data) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.linkPage,
        data: data,
      );
      if (response != null && response['success'] == true) {
        return ApiResult.success(
          data: PatientResponse.fromJson(response['data']),
        );
      }
      return ApiResult.failure(
        error: ServerException(message: response?["message"]),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<bool>> uploadPoints(UploadPointRequest data) async {
    try {
      final points = [];
      for (final point in data.pointsToAdd) {
        points.add(point.toJson());
      }
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.uploadPoints,
        data: {'pageNumber': data.pageNumber, 'pointsToAdd': points},
      );
      if (response != null && response['success'] == true) {
        return const ApiResult.success(data: true);
      }
      return ApiResult.failure(
        error: ServerException(message: response?["message"]),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<List<PatientResponse>>> addMobileNumberToPage(
      String mobileNumber, int pageNumber) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.addMobileNumber,
        data: {'mobileNumber': mobileNumber, 'pageNumber': pageNumber},
      );
      if (response != null && response['success'] == true) {
        return ApiResult.success(
          data: (response['data']['patients'] as List)
              .map((e) => PatientResponse.fromJson(e))
              .toList(),
        );
      }
      return ApiResult.failure(
        error: ServerException(message: response?["message"]),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
}
