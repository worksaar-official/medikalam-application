// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'dart:io';

// ignore: one_member_abstracts
abstract interface class AttachmentRepo {
  Future<ApiResult<Map<String, dynamic>>> upload();

  /// Upload multiple files to the server
  Future<ApiResult<Map<String, dynamic>>> uploadFiles(
    List<File> files, {
    String? caseId,
    String? fileType,
    Map<String, dynamic>? additionalData,
  });
}
