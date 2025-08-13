// Package imports:

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/appointment/appointment_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/models/appointment/appointment_model.dart';

@LazySingleton(as: AppointmentRepo)
class AppointmentRepoImpl implements AppointmentRepo {
  @override
  Future<ApiResult<AppointmentResponse>> create(
      Map<String, dynamic> data) async {
    try {
      logger.w("Data $data");
      final response = await Helpers.sendRequest(
          RequestType.post, EndPoints.createAppointment,
          data: data);

      return ApiResult.success(
          data: AppointmentResponse.fromJson(
              response?['data'] as Map<String, dynamic>));
    } on ServerException catch (e) {
      return ApiResult.failure(
          error: ServerException(code: e.code, message: e.message));
    }
  }

  @override
  Future<ApiResult<bool>> delete(String id) async {
    try {
      await Helpers.sendRequest(RequestType.delete, EndPoints.deleteAppointment,
          queryParams: {'id': id});
      return const ApiResult.success(data: true);
    } on ServerException catch (e) {
      return ApiResult.failure(
          error: ServerException(code: e.code, message: e.message));
    }
  }

  @override
  Future<ApiResult<(int?, List<AppointmentResponse>)>> getAll(
      {Map<String, dynamic>? filters}) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.get, EndPoints.getAllAppointments,
          queryParams: filters);
      if (response?['success'] == true) {
        List data = response?['data']['appointments'] as List;
        List<AppointmentResponse> appointments = [];
        int? nextPage;

        if (data.isNotEmpty) {
          appointments =
              data.map((e) => AppointmentResponse.fromJson(e)).toList();
          // Calculate next page if applicable
          nextPage = (response?['data']['currentPage'] <
                  response?['data']['totalPages'])
              ? (response?['data']['currentPage'] as int) + 1
              : null;
        }

        return ApiResult.success(data: (nextPage, appointments));
      } else {
        return const ApiResult.success(data: (null, []));
      }
    } on ServerException catch (e) {
      return ApiResult.failure(
          error: ServerException(code: e.code, message: e.message));
    }
  }

  @override
  Future<ApiResult<AppointmentResponse>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<AppointmentResponse>> update(
      Map<String, dynamic> data, String id) async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.put, EndPoints.updateAppointment,
          data: data);
      return ApiResult.success(
          data: AppointmentResponse.fromJson(
              response?['data'] as Map<String, dynamic>));
    } on ServerException catch (e) {
      return ApiResult.failure(
          error: ServerException(code: e.code, message: e.message));
    }
  }

  @override
  Future<ApiResult<List<AppointmentResponse>>> upcomingAppt() async {
    try {
      final response = await Helpers.sendRequest(
          RequestType.get, EndPoints.upcomingAppointments);
      if (response?['success'] == true) {
        List data = response?['data'] as List;
        List<AppointmentResponse> appointments = [];
        if (data.isNotEmpty) {
          appointments =
              data.map((e) => AppointmentResponse.fromJson(e)).toList();
        }
        return ApiResult.success(data: appointments);
      } else {
        return const ApiResult.success(data: []);
      }
    } on ServerException catch (e) {
      return ApiResult.failure(
          error: ServerException(code: e.code, message: e.message));
    }
  }
}
