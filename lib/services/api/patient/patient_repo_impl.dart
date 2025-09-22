// Package imports:

// Package imports:

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/patient/patient_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/generatePDF/generate_pdf_response.dart';
import 'package:Medikalam/src/models/page_details/page_details_response.dart';
import 'package:Medikalam/src/models/patient/patient.dart';
import 'package:Medikalam/src/models/patient/patient_details.dart';
import 'package:Medikalam/src/models/share_prescription/share_prescription_response.dart';
import 'package:Medikalam/src/models/view_case/view_case_response.dart';

@LazySingleton(as: PatientRepo)
class PatientRepoImpl implements PatientRepo {
  @override
  Future<ApiResult<(int?, List<PatientResponse>)>> getAll(
      {Map<String, dynamic>? filters}) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.patientList,
          data: filters);

      final patients = (response?['data']['patients'] as List)
          .map((e) => PatientResponse.fromJson(e))
          .toList();
      final nextPage =
          (response?['data']['currentPage'] < response?['data']['totalPages']
              ? (response?['data']['currentPage'] as int) + 1
              : null);
      return ApiResult.success(data: (nextPage, patients));
    } on ServerException catch (e) {
      return ApiResult.failure(
          error: ServerException(code: e.code, message: e.message));
    }
  }

  @override
  Future<ApiResult<PatientResponse>> caseHistory({
    required int pageNumber,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.caseHistory,
        data: {'pageNumber': pageNumber},
      );

      return ApiResult.success(
        data: PatientResponse.fromJson(
          response!['data'] as Map<String, dynamic>,
        ),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<PatientResponse>> create(Map<String, dynamic> data) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.addPatient,
          data: data);
      if (response?["success"] == true) {
        return ApiResult.success(
            data: PatientResponse.fromJson(
                response?['data']['patientDetails'] as Map<String, dynamic>));
      }
      return ApiResult.failure(
          error: ServerException(message: response?["message"]));
    } on ServerException catch (e) {
      return ApiResult.failure(
          error: ServerException(code: e.code, message: e.message));
    }
  }

  @override
  Future<ApiResult<PatientResponse>> addPatientDetailsToPage({
    required int pageNumber,
    required FormGroup form,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.addPatientDetails,
        data: {
          'pageNumber': pageNumber,
          'fullName': form.control('name').value,
          'gender': form.control('gender').value,
          'mobileNumber': form.control('mobileNumber').value,
          // 'email': 'johndoe@example.com',
        },
      );
      final patientJson = response!['data']['patient'];
      return ApiResult.success(data: PatientResponse.fromJson(patientJson));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<PageDetailsResponse>> viewPageDetails({
    required int pageNumber,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.viewPageDetails,
        data: {'pageNumber': pageNumber},
      );

      return ApiResult.success(data: PageDetailsResponse.fromJson(response!));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  //merge cases api left

  @override
  Future<ApiResult<PrescriptionModel>> sharePrescription({
    required int caseId,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.sharePrescription,
        data: {
          'caseId': caseId,
        },
      );

      return ApiResult.success(data: PrescriptionModel.fromJson(response!));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<PdfGenerationModel>> generatepDF({
    required int caseId,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.generateCasepdf,
        data: {
          'caseId': caseId,
        },
      );

      return ApiResult.success(data: PdfGenerationModel.fromJson(response!));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<ViewCaseModel>> viewCase({
    required String caseId,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.caseView,
        data: {
          'caseId': caseId,
        },
      );

      return ApiResult.success(data: ViewCaseModel.fromJson(response!));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<PatientDetails>> viewpatient({
    required String patientId,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.patientView,
        data: {
          'patientId': patientId,
        },
      );

      return ApiResult.success(data: PatientDetails.fromJson(response ?? {}));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<bool>> delete(String id) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.delete,
        EndPoints.patientDelete,
        data: {
          'uid': id,
        },
      );

      if (response?["success"] == true) {
        return const ApiResult.success(data: true);
      }
      return ApiResult.failure(
          error: ServerException(message: response?["message"]));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<PatientResponse>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<PatientResponse>> update(
      Map<String, dynamic> data, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
