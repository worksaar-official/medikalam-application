// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/auth/auth_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/auth/login_response.dart';

///Implements AuthRepo Abstract Interface
@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  @override
  Future<ApiResult<LoginData>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.login,
        queryParams: {'email': email, 'password': password},
      );

      return ApiResult.success(
        data: LoginData.fromJson(response?['data'] as Map<String, dynamic>),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
  
  @override
  Future<ApiResult<User>> update(User user) async{
    try {
      final response = await Helpers.sendRequest(
        RequestType.put,
        EndPoints.updateProfile,
        data: user.toJson(),
      );

      return ApiResult.success(
        data: User.fromJson(response?['data'] as Map<String, dynamic>),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: 500, message: e.message),
      );
      
    }
  }
}
