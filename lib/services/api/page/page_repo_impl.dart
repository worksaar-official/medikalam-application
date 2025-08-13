// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/page/page_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/page_config/page_config_response.dart';

@LazySingleton(as: PageRepo)
class PageRepoImpl implements PageRepo {
  @override
  Future<ApiResult<PageConfigResponse>> getPageConfig() async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.getpageConfig,
          data: {});

      return ApiResult.success(
        data: PageConfigResponse.fromJson(response!),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> getJson(String url) async {
    try {
      final response = await Helpers.sendRequest(RequestType.get, url);
      return ApiResult.success(data: response ?? {});
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
}
