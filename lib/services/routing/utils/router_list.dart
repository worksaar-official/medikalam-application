// Package imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/models/patient/patient.dart';
import 'package:Medikalam/src/views/screens/auth/login.dart';
import 'package:Medikalam/src/views/screens/auth/new_password_screen.dart';
import 'package:Medikalam/src/views/screens/auth/reset_password_screen.dart';
import 'package:Medikalam/src/views/screens/care_guide/care_guides.dart';
import 'package:Medikalam/src/views/screens/dashboard/dashboard_screen.dart';
import 'package:Medikalam/src/views/screens/dashboard/patient_landing_screen.dart';
import 'package:Medikalam/src/views/screens/dashboard/today_appt/add_documents.dart';
import 'package:Medikalam/src/views/screens/dashboard/today_appt/book_appointment.dart';
import 'package:Medikalam/src/views/screens/landing_screen.dart';
import 'package:Medikalam/src/views/screens/patient/add_patient.dart';
import 'package:Medikalam/src/views/screens/patient/case_details.dart';
import 'package:Medikalam/src/views/screens/patient/patient_details_page.dart';
import 'package:Medikalam/src/views/screens/patient/prescription_paper.dart';
import 'package:Medikalam/src/views/screens/profile/edit_profile.dart';
import 'package:Medikalam/src/views/screens/profile/profile.dart';
import 'package:Medikalam/src/views/screens/splash_screen.dart';
import 'package:Medikalam/src/views/screens/visit_registration/report.dart';
import 'package:Medikalam/src/views/screens/visit_registration/visit_register.dart';
import 'package:Medikalam/src/views/widgets/qr_scanner.dart';

///List of all routes using name and path extensions
final List<GoRoute> routerList = [
  GoRoute(
    path: AppScreens.splash.path,
    name: AppScreens.splash.name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
      path: AppScreens.landing.path,
      name: AppScreens.landing.name,
      builder: (context, state) => const LandingScreen()),
  GoRoute(
    path: AppScreens.login.path,
    name: AppScreens.login.name,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: AppScreens.resetPassword.path,
    name: AppScreens.resetPassword.name,
    pageBuilder: (context, state) => _createPage(const ResetPasswordScreen()),
  ),
  GoRoute(
    path: AppScreens.newPassword.path,
    name: AppScreens.newPassword.name,
    pageBuilder: (context, state) => _createPage(const NewPasswordScreen()),
  ),
  GoRoute(
    path: AppScreens.dashboard.path,
    name: AppScreens.dashboard.name,
    pageBuilder: (context, state) => _createPage(const DashboardScreen()),
  ),
  GoRoute(
    path: AppScreens.patientLanding.path,
    name: AppScreens.patientLanding.name,
    pageBuilder: (context, state) {
      final dynamic extra = state.extra;
      OperationMode operationMode = OperationMode.render;
      bool showBottomSheet = false;

      if (extra is Map<String, dynamic>) {
        operationMode =
            extra['operationMode'] as OperationMode? ?? OperationMode.render;
        showBottomSheet = extra['showBottomSheet'] as bool? ?? false;
      } else if (extra is OperationMode) {
        operationMode = extra;
      }

      return _createPage(
        PatientLandingPage(
          operationMode: operationMode,
          showBottomSheet: showBottomSheet,
        ),
      );
    },
  ),
  GoRoute(
    path: AppScreens.registerVisit.path,
    name: AppScreens.registerVisit.name,
    pageBuilder: (context, state) => _createPage(const RegisterVisitPage()),
  ),
  GoRoute(
    path: AppScreens.profile.path,
    name: AppScreens.profile.name,
    pageBuilder: (context, state) => _createPage(const ProfilePage()),
  ),
  GoRoute(
    path: AppScreens.editProfile.path,
    name: AppScreens.editProfile.name,
    pageBuilder: (context, state) => _createPage(const EditProfile()),
  ),
  GoRoute(
    path: AppScreens.careGuides.path,
    name: AppScreens.careGuides.name,
    pageBuilder: (context, state) => _createPage(const CareGuidePage()),
  ),
  GoRoute(
    path: AppScreens.addPatient.path,
    name: AppScreens.addPatient.name,
    pageBuilder: (context, state) => _createPage(const AddPatientPage()),
  ),
  GoRoute(
    path: AppScreens.caseDetail.path,
    name: AppScreens.caseDetail.name,
    pageBuilder: (context, state) =>
        _createPage(CaseDetails(caseId: state.extra as String)),
  ),
  GoRoute(
      path: AppScreens.prescriptionPaper.path,
      name: AppScreens.prescriptionPaper.name,
      pageBuilder: (context, state) => _createPage(const PrescriptionPaper())),
  GoRoute(
      path: AppScreens.qrScanner.path,
      name: AppScreens.qrScanner.name,
      pageBuilder: (context, state) => _createPage(const QrScanner())),
  GoRoute(
    path: AppScreens.patientDetail.path,
    name: AppScreens.patientDetail.name,
    pageBuilder: (context, state) =>
        _createPage(PatientDetailsPage(pData: state.extra as PatientResponse)),
  ),
  GoRoute(
    path: AppScreens.bookAppointment.path,
    name: AppScreens.bookAppointment.name,
    pageBuilder: (context, state) => _createPage(const BookAppointment()),
  ),
  GoRoute(
    path: AppScreens.addDocuments.path,
    name: AppScreens.addDocuments.name,
    pageBuilder: (context, state) => _createPage(const AddDocuments()),
  ),
  GoRoute(
    path: AppScreens.report.path,
    name: AppScreens.report.name,
    pageBuilder: (context, state) => _createPage(const ReportPage()),
  ),
];

CustomTransitionPage _createPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
