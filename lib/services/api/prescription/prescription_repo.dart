// Dart imports:
import 'dart:io';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/src/models/media/media_response.dart';
import 'package:Medikalam/src/models/new_prescription/initialize_page_response.dart';
import 'package:Medikalam/src/models/new_prescription/upload_point_request.dart';
import 'package:Medikalam/src/models/patient/patient.dart';

abstract interface class PrescriptionRepo {
  Future<ApiResult<List<PatientResponse>>> addMobileNumberToPage(String mobileNumber, int pageNumber);
  Future<ApiResult<InitializePageResponse>> initialisePage(int pageNumber);
  Future<ApiResult<InitializePageResponse>> scanQr(int pageNumber);
  Future<ApiResult<PatientResponse>> linkPage(Map<String, dynamic> data);
  Future<ApiResult<bool>> uploadPoints(UploadPointRequest data);
  Future<ApiResult<MediaResponse>> uploadMedia(String pageId,File mediaFile);
}
