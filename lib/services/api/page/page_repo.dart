// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/src/models/page_config/page_config_response.dart';

abstract interface class PageRepo {
  Future<ApiResult<PageConfigResponse>> getPageConfig();
  Future<ApiResult<Map<String, dynamic>>> getJson(String url);
}
