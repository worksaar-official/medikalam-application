// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/src/models/dashboard/dash_response.dart';

abstract interface class DashboardRepo {
  Future<ApiResult<DashboardData>> dashboardData();
}
