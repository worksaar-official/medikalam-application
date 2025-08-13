// Project imports:
import 'package:Medikalam/services/api/api_result.dart';

// ignore: one_member_abstracts
abstract interface class AttachmentRepo {
  Future<ApiResult<Map<String, dynamic>>> upload();
}
