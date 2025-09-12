// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:Medikalam/services/api/appointment/appointment_repo.dart'
    as _i458;
import 'package:Medikalam/services/api/appointment/appointment_repo_impl.dart'
    as _i1009;
import 'package:Medikalam/services/api/attachments/attachment_repo.dart'
    as _i83;
import 'package:Medikalam/services/api/auth/auth_repo.dart' as _i137;
import 'package:Medikalam/services/api/auth/auth_repo_impl.dart' as _i427;
import 'package:Medikalam/services/api/care_guide/care_guide_repo_impl.dart'
    as _i1050;
import 'package:Medikalam/services/api/care_guide/care_repo.dart' as _i383;
import 'package:Medikalam/services/api/dashboard/dashboard_repo.dart' as _i1022;
import 'package:Medikalam/services/api/dashboard/dashboard_repo_impl.dart'
    as _i70;
import 'package:Medikalam/services/api/page/page_repo.dart' as _i979;
import 'package:Medikalam/services/api/page/page_repo_impl.dart' as _i451;
import 'package:Medikalam/services/api/patient/patient_repo.dart' as _i972;
import 'package:Medikalam/services/api/patient/patient_repo_impl.dart' as _i203;
import 'package:Medikalam/services/api/prescription/prescription_repo.dart'
    as _i546;
import 'package:Medikalam/services/api/prescription/prescription_repo_impl.dart'
    as _i636;
import 'package:Medikalam/src/core/injection/image_service.dart' as _i1005;
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart'
    as _i617;
import 'package:Medikalam/src/providers/auth/auth_provider.dart' as _i988;
import 'package:Medikalam/src/providers/dashboard/dashboard_provider.dart'
    as _i583;
import 'package:Medikalam/src/providers/form/form_provider.dart' as _i803;
import 'package:Medikalam/src/providers/guide/guide_provider.dart' as _i799;
import 'package:Medikalam/src/providers/patient/patient_provider.dart' as _i423;
import 'package:Medikalam/src/providers/pen/pen_provider.dart' as _i66;
import 'package:Medikalam/src/providers/permission/permission_provider.dart'
    as _i532;
import 'package:Medikalam/src/providers/prescription/audio_provider.dart'
    as _i951;
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart'
    as _i716;
import 'package:Medikalam/src/providers/registration/registration_provider.dart'
    as _i690;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i799.CareGuideProvider>(() => _i799.CareGuideProvider());
    gh.factory<_i803.FormProvider>(() => _i803.FormProvider());
    gh.factory<_i988.AuthProvider>(() => _i988.AuthProvider());
    gh.factory<_i951.AudioProvider>(() => _i951.AudioProvider());
    gh.factory<_i716.PrescriptionProvider>(() => _i716.PrescriptionProvider());
    gh.factory<_i66.PenProvider>(() => _i66.PenProvider());
    gh.factory<_i583.DashboardProvider>(() => _i583.DashboardProvider());
    gh.factory<_i532.PermissionListenerProvider>(
        () => _i532.PermissionListenerProvider());
    gh.lazySingleton<_i1005.ImageService>(() => _i1005.ImageService());
    gh.lazySingleton<_i1022.DashboardRepo>(() => _i70.DashboardRepoImpl());
    gh.lazySingleton<_i546.PrescriptionRepo>(
        () => _i636.PrescriptionRepoImpl());
    gh.lazySingleton<_i458.AppointmentRepo>(() => _i1009.AppointmentRepoImpl());
    gh.lazySingleton<_i979.PageRepo>(() => _i451.PageRepoImpl());
    gh.lazySingleton<_i972.PatientRepo>(() => _i203.PatientRepoImpl());
    gh.factory<_i617.AppointmentProvider>(
        () => _i617.AppointmentProvider(gh<_i458.AppointmentRepo>()));
    gh.lazySingleton<_i137.AuthRepo>(() => _i427.AuthRepoImpl());
    gh.lazySingleton<_i383.CareGuideRepo>(() => _i1050.CareGuideRepoImpl());
    gh.factory<_i690.RegistrationProvider>(
        () => _i690.RegistrationProvider(gh<_i83.AttachmentRepo>()));
    gh.factory<_i423.PatientProvider>(
        () => _i423.PatientProvider(gh<_i972.PatientRepo>()));
    return this;
  }
}
