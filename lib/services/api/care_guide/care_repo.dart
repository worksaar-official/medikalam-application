// Package imports:

// Package imports:

// Project imports:
import 'package:Medikalam/services/api/api_result.dart';
import 'package:Medikalam/src/models/care_guide/care_guide_video_response.dart';
import 'package:Medikalam/src/models/page_guide_response/guide_link_model.dart';

abstract interface class CareGuideRepo {
  // Future<ApiResult<Map<String, dynamic>>> addVideoGuide({
  //   required FormGroup form,
  // });
  Future<ApiResult<CareGuideVideoResponse>> videoGuideList({
    required int pageNumber,
  });
  Future<ApiResult<CareGuideVideoResponse>> changeGuideposition({
    required int guideId,
    required int position,
  });
  Future<ApiResult<GuideLinkModel>> addPageGuide({
    required int guideId,
    required int pageNumber,
  });

  Future<ApiResult<List<CareGuideVideoResponse>>> getCareGuides({
    required String hospitalId,
    required String uid,
  });
  Future<ApiResult<Map<String,dynamic>>> addVideoGuide({
    Map<String,dynamic> data,
  });
}
