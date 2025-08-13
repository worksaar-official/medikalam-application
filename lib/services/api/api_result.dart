// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:Medikalam/src/core/errors/exception.dart';

part 'api_result.freezed.dart';

///API Result Freezed Class
@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  ///Access Success After Successful Api Calls
  const factory ApiResult.success({required T data}) = Success<T>;

  ///Access Failure After Un-Successful Api Calls
  const factory ApiResult.failure({required ServerException error}) =
      Failure<T>;
}
