// Package imports:

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';
import 'package:Medikalam/src/providers/auth/auth_provider.dart';
import 'package:Medikalam/src/providers/dashboard/dashboard_provider.dart';
import 'package:Medikalam/src/providers/form/form_provider.dart';
import 'package:Medikalam/src/providers/guide/guide_provider.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/providers/permission/permission_provider.dart';
import 'package:Medikalam/src/providers/prescription/audio_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';
import 'package:Medikalam/src/providers/registration/registration_provider.dart';

final List providers = [
  ChangeNotifierProvider(create: (context) => getIt<PermissionListenerProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PrescriptionProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<DashboardProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PatientProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<FormProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<CareGuideProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<RegistrationProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PenProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AudioProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AppointmentProvider>()),
];
