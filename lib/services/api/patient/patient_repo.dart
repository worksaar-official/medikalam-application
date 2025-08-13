// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/global/base_repository.dart';
import 'package:Medikalam/src/models/generatePDF/generate_pdf_response.dart';
import 'package:Medikalam/src/models/page_details/page_details_response.dart';
import 'package:Medikalam/src/models/patient/patient.dart';
import 'package:Medikalam/src/models/patient/patient_details.dart';
import 'package:Medikalam/src/models/share_prescription/share_prescription_response.dart';
import 'package:Medikalam/src/models/view_case/view_case_response.dart';

abstract interface class PatientRepo extends BaseRepository<PatientResponse> {
  Future<ApiResult<PatientResponse>> caseHistory({required int pageNumber});
  Future<ApiResult<PatientResponse>> addPatientDetailsToPage({
    required int pageNumber,
    required FormGroup form,
  });
  Future<ApiResult<PageDetailsResponse>> viewPageDetails({
    required int pageNumber,
  });
  Future<ApiResult<PrescriptionModel>> sharePrescription({required int caseId});
  Future<ApiResult<PdfGenerationModel>> generatepDF({required int caseId});
  Future<ApiResult<ViewCaseModel>> viewCase({required String caseId});
  Future<ApiResult<PatientDetails>> viewpatient({required String patientId});
}
