// ignore_for_file: one_member_abstracts

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/src/models/auth/login_response.dart';

///This Abstract Class Will Implement All Auth Related API Calling
abstract interface class AuthRepo {
  Future<ApiResult<LoginData>> login({
    required String email,
    required String password,
  });
  Future<ApiResult<User>> update(User user);
}
