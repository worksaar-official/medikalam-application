// Project imports:
import 'package:Medikalam/src/core/utils/environment/environment.dart';

//API Endpoints
class EndPoints {
  static String apiBaseUrl = Environment.apiBaseUrl;

  //Auth
  static const String login = 'auth/login';//
  //User
  static const String updateProfile = 'api/doctor/update';//


  //Media
  static const String uploadMedia = 'api/media/upload';//
  //Page

  static const String initializePageQr = 'api/page/scan-qr';//
  static const String initializePage = 'api/page/initialize';//
  static const String linkPage = 'api/page/linkPage';//
  static const String addMobileNumber ='api/page/addMobileNumber';

  //patient
  static const String patientDelete = 'api/patients/delete';//
  static const String patientList = 'api/patients/list';//
  static const String addPatient = 'api/patients/add';//
  static const String patientView = 'api/patients/view';//
  static const String addPatientDetails = 'api/page/addDetails';//
  static const String sharePrescription = 'api/case/submit';//
  static const String caseHistory = 'api/case/history';//
  static const String viewPageDetails = 'api/page/view';//
  static const String mergeCases = 'api/case/merge';//
  static const String generateCasepdf = 'api/case/generatePDF';//
  static const String caseView = 'api/case/view';//
  static const String addAttachmentToCase = 'api/page/additional/upload';//

  // careGuide
  static const String videoGuideList = 'api/guides/list';//
  static const String addVideoGuide = 'api/guides/addVideo';//
  static const String changeGuidePosition = 'api/guides/setPosition';//
  static const String addGuideToPage = 'api/page/additional/linkGuide';//

  //dashBoard

  static const String dashboardData = 'api/home';//
  static const String uploadPoints = 'api/page/addPoints';//

  //Page Config
  static const String getpageConfig = 'api/doctor/getPageConfig';//

  //Appointment
  static const String getAllAppointments = 'api/appointments';//
  static const String createAppointment = 'api/appointments';//
  static const String updateAppointment = 'api/appointments'; // TODO:
  static const String deleteAppointment = 'api/appointments'; // TODO:
  static const String upcomingAppointments = 'api/upcoming_appointments';//
}
