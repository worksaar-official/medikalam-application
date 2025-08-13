// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/attachments/attachment_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';

///Implements AuthRepo Abstract Interface
class AttachmentRepoImpl implements AttachmentRepo {
  @override
  Future<ApiResult<Map<String, dynamic>>> upload() async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.addAttachmentToCase,
        queryParams: {},
      );

      return ApiResult.success(
        data: response!,
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
}
