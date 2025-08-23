// Flutter imports:
import 'package:flutter/material.dart';
import 'dart:io';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/attachments/attachment_repo.dart';
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/src/core/errors/exception.dart';

@injectable
class RegistrationProvider with ChangeNotifier {
  final AttachmentRepo _attachmentRepo;

  RegistrationProvider(this._attachmentRepo);

  String _selectedIndex = 'M';
  List<File> _previousDescriptionFiles = [];
  List<File> _oldReportFiles = [];
  bool _isUploading = false;

  String get selectedIndex => _selectedIndex;
  List<File> get previousDescriptionFiles => _previousDescriptionFiles;
  List<File> get oldReportFiles => _oldReportFiles;
  bool get isUploading => _isUploading;

  void selectRadio(String value) {
    if (_selectedIndex != value) {
      _selectedIndex = value;
      notifyListeners();
    }
  }

  void addPreviousDescriptionFiles(List<File> files) {
    _previousDescriptionFiles.addAll(files);
    notifyListeners();
  }

  void removePreviousDescriptionFile(int index) {
    if (index >= 0 && index < _previousDescriptionFiles.length) {
      _previousDescriptionFiles.removeAt(index);
      notifyListeners();
    }
  }

  void addOldReportFiles(List<File> files) {
    _oldReportFiles.addAll(files);
    notifyListeners();
  }

  void removeOldReportFile(int index) {
    if (index >= 0 && index < _oldReportFiles.length) {
      _oldReportFiles.removeAt(index);
      notifyListeners();
    }
  }

  void clearAllFiles() {
    _previousDescriptionFiles.clear();
    _oldReportFiles.clear();
    notifyListeners();
  }

  void setUploading(bool uploading) {
    _isUploading = uploading;
    notifyListeners();
  }

  bool get hasFiles =>
      _previousDescriptionFiles.isNotEmpty || _oldReportFiles.isNotEmpty;

  /// Upload all files to the backend
  Future<ApiResult<Map<String, dynamic>>> uploadAllFiles({
    String? caseId,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      setUploading(true);

      final allFiles = <File>[];
      allFiles.addAll(_previousDescriptionFiles);
      allFiles.addAll(_oldReportFiles);

      if (allFiles.isEmpty) {
        return ApiResult.failure(
          error: ServerException(code: 400, message: 'No files to upload'),
        );
      }

      final result = await _attachmentRepo.uploadFiles(
        allFiles,
        caseId: caseId,
        additionalData: additionalData,
      );

      return result.when(
        success: (data) {
          // Clear files after successful upload
          clearAllFiles();
          return result;
        },
        failure: (error) => result,
      );
    } catch (e) {
      return ApiResult.failure(
        error: ServerException(code: 500, message: e.toString()),
      );
    } finally {
      setUploading(false);
    }
  }
}
