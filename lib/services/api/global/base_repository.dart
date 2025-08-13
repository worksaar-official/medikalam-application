// Project imports:
import 'package:Medikalam/services/api/api_result.dart';

abstract class BaseRepository<T> {
  Future<ApiResult<T>> create(Map<String, dynamic> data);

  Future<ApiResult<T>> getById(String id);

  Future<ApiResult<(int?, List<T>)>> getAll({Map<String, dynamic>? filters});

  Future<ApiResult<T>> update(Map<String, dynamic> data, String id);

  Future<ApiResult<bool>> delete(String id);
}
