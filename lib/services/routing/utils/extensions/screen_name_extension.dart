/// All Screen Names
enum AppScreens {
  splash,
  landing,
  login,
  resetPassword,
  newPassword,
  dashboard,
  patientLanding,
  registerVisit,
  profile,
  editProfile,
  careGuides,
  addPatient,
  caseDetail,
  prescriptionPaper,
  prescription,
  patientDetail,
  bookAppointment,
  addDocuments,
  report,
  qrScanner,
}

extension AppScreensExtension on AppScreens {
  String get name {
    switch (this) {
      case AppScreens.splash:
        return 'Splash Screen';
      case AppScreens.landing:
        return 'Landing Screen';
      case AppScreens.login:
        return 'Login Screen';
      case AppScreens.resetPassword:
        return 'Reset Password Screen';
      case AppScreens.newPassword:
        return 'New Password Screen';
      case AppScreens.dashboard:
        return 'Dashboard';
      case AppScreens.registerVisit:
        return 'Register Visit';
      case AppScreens.profile:
        return 'Profile';
      case AppScreens.editProfile:
        return 'Edit Profile';
      case AppScreens.careGuides:
        return 'Care Guides';
      case AppScreens.addPatient:
        return 'Add Patient';
      case AppScreens.caseDetail:
        return 'Case Detail';
      case AppScreens.prescriptionPaper:
        return 'Prescription Paper';
      case AppScreens.prescription:
        return 'Prescription';
      case AppScreens.patientDetail:
        return 'Patient Detail';
      case AppScreens.bookAppointment:
        return 'Book Appointment';
      case AppScreens.addDocuments:
        return 'Add Documents';
      case AppScreens.report:
        return 'Reort';
      case AppScreens.patientLanding:
       return 'Patient Landing';
      case AppScreens.qrScanner:
        return 'QR Scanner';
    }
  }

  String get path {
    switch (this) {
      case AppScreens.splash:
        return '/splash';
      case AppScreens.landing:
        return '/landing';
      case AppScreens.login:
        return '/login';
      case AppScreens.resetPassword:
        return '/reset-password';
      case AppScreens.newPassword:
        return '/new-password';
      case AppScreens.dashboard:
        return '/dashboard';
      case AppScreens.registerVisit:
        return '/registerVisit';
      case AppScreens.profile:
        return '/profile';
      case AppScreens.editProfile:
        return '/editProfile';
      case AppScreens.careGuides:
        return '/careGuide';
      case AppScreens.addPatient:
        return '/addPatient';
      case AppScreens.caseDetail:
        return '/caseDetail';
      case AppScreens.prescriptionPaper:
        return '/prescriptionPaper';
      case AppScreens.prescription:
        return '/prescription';
      case AppScreens.patientDetail:
        return '/patientDetail';
      case AppScreens.bookAppointment:
        return '/bookAppointment';
      case AppScreens.addDocuments:
        return '/addDocuments';
      case AppScreens.report:
        return '/report';
      case AppScreens.patientLanding:
       return '/patientLanding';
      case AppScreens.qrScanner:
        return '/qrScanner';
    }
  }
}
