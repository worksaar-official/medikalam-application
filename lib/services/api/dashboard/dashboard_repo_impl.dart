// Package imports:

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/dashboard/dashboard_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/dashboard/dash_response.dart';

@LazySingleton(as: DashboardRepo)
class DashboardRepoImpl implements DashboardRepo {
  @override
  Future<ApiResult<DashboardData>> dashboardData() async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.dashboardData,
      );

      return ApiResult.success(
          data: DashboardData.fromJson(response?['data'] ?? {}));
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
}
