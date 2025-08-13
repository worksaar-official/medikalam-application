// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/global/base_repository.dart';
import 'package:Medikalam/src/models/appointment/appointment_model.dart';

abstract interface class AppointmentRepo
    extends BaseRepository<AppointmentResponse> {
  Future<ApiResult<List<AppointmentResponse>>> upcomingAppt();
}
