// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/attachments/attachment_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'dart:io';
import 'package:dio/dio.dart';

///Implements AuthRepo Abstract Interface
class AttachmentRepoImpl implements AttachmentRepo {
  @override
  Future<ApiResult<Map<String, dynamic>>> upload() async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.addAttachmentToCase,
        queryParams: {},
      );

      return ApiResult.success(
        data: response!,
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  /// Upload files to the server
  Future<ApiResult<Map<String, dynamic>>> uploadFiles(
    List<File> files, {
    String? caseId,
    String? fileType,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      // Create FormData for file upload
      final formData = FormData();

      // Add files to form data
      for (int i = 0; i < files.length; i++) {
        final file = files[i];
        final fileName = file.path.split('/').last;
        formData.files.add(
          MapEntry(
            'files',
            await MultipartFile.fromFile(
              file.path,
              filename: fileName,
            ),
          ),
        );
      }

      // Add additional data
      if (caseId != null) {
        formData.fields.add(MapEntry('caseId', caseId));
      }
      if (fileType != null) {
        formData.fields.add(MapEntry('fileType', fileType));
      }
      if (additionalData != null) {
        additionalData.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.addAttachmentToCase,
        data: formData,
      );

      return ApiResult.success(
        data: response!,
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    } catch (e) {
      return ApiResult.failure(
        error: ServerException(code: 500, message: e.toString()),
      );
    }
  }
}
