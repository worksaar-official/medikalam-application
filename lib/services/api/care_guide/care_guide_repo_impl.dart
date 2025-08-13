// Package imports:

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/services/api/care_guide/care_repo.dart';
import 'package:Medikalam/src/core/errors/exception.dart';
import 'package:Medikalam/src/core/utils/constants/api_endpoints.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/care_guide/care_guide_video_response.dart';
import 'package:Medikalam/src/models/page_guide_response/guide_link_model.dart';

@LazySingleton(as: CareGuideRepo)
class CareGuideRepoImpl implements CareGuideRepo {
  @override
  Future<ApiResult<Map<String,dynamic>>> addVideoGuide({
    Map<String,dynamic>? data,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        'add',
        data: data,
      );

      return ApiResult.success(data: response!);
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
  // Future<ApiResult<Map<String, dynamic>>> addVideoGuide({
  //   required FormGroup form,
  // }) async {
  //   try {
  //     final response = await Helpers.sendRequest(
  //       RequestType.post,
  //       EndPoints.addVideoGuide,
  //       data: form,
  //     );

  //     return ApiResult.success(data: response!);
  //   } on ServerException catch (e) {
  //     return ApiResult.failure(
  //       error: ServerException(code: e.code, message: e.message),
  //     );
  //   }
  // }

  @override
  Future<ApiResult<CareGuideVideoResponse>> videoGuideList({
    required int pageNumber,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.videoGuideList,
        data: {'pageNumber': 1},
      );

      return ApiResult.success(
        data: CareGuideVideoResponse.fromJson(response!),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<CareGuideVideoResponse>> changeGuideposition({
    required int guideId,
    required int position,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.changeGuidePosition,
        data: {
          'position': 2,
          'guideId': 1,
        },
      );

      return ApiResult.success(
        data: CareGuideVideoResponse.fromJson(response!),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  Future<ApiResult<GuideLinkModel>> addPageguide({
    required int guideId,
    required int pageNumber,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.addGuideToPage,
        data: {
          'pageNumber': 1,
          'guideId': 1,
        },
      );

      return ApiResult.success(
        data: GuideLinkModel.fromJson(response!),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<GuideLinkModel>> addPageGuide({
    required int guideId,
    required int pageNumber,
  }) async {
    try {
      final response = await Helpers.sendRequest(
        RequestType.post,
        EndPoints.addGuideToPage,
        data: {
          'pageNumber': 1,
          'guideId': 1,
        },
      );

      return ApiResult.success(
        data: GuideLinkModel.fromJson(response!),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }

  @override
  Future<ApiResult<List<CareGuideVideoResponse>>> getCareGuides({
    required String hospitalId,
    required String uid,
  }) async{
    try {
      final response = await Helpers.sendRequest(
        RequestType.get,
        EndPoints.videoGuideList,
        // data: {
        //   'hospitalId': hospitalId,
        //   'uid': uid,
        // },
      );

      return ApiResult.success(
        data: (response!['data']['allGuides'] as List)
            .map((e) => CareGuideVideoResponse.fromJson(e))
            .toList(),
      );
    } on ServerException catch (e) {
      return ApiResult.failure(
        error: ServerException(code: e.code, message: e.message),
      );
    }
  }
}
