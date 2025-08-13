// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:Medikalam/services/api/care_guide/care_repo.dart';
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/models/care_guide/care_guide_video_response.dart';

@injectable
class CareGuideProvider extends ChangeNotifier {
  final CareGuideRepo _repo = getIt<CareGuideRepo>();
  List<CareGuideVideoResponse> careGuides = [];
  // Initialize form
  FormGroup form = FormGroup({
    'name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'description': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'url': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });

  Future<void> addVideoGuide(String doctorId, String hospitalId) async {
    try {
      final body = {
        'name': form.control('name').value,
        'description': form.control('description').value,
        'url': form.control('url').value,
        'hospitalId': hospitalId,
        'doctorId': doctorId,
      };
      if(form.invalid) {
        showError('Please fill all the fields');
        return;
      }
      final data = await _repo.addVideoGuide(data:body);

      data.when(
        success: (success) {
          debugPrint(success.toString());
          // Perform any additional state updates here if necessary
          form.reset();
          showSuccess('Video Guide Added Successfully');
          
          notifyListeners();
        },
        failure: (failure) {
          debugPrint(failure.toString());
          showError(failure.toString());
        },
      );
    } catch (e) {
      // debugPrint(e.toString());
      showError(e.toString());
      // debugPrintStack(stackTrace: s);
    }
  }

  Future<void> getCareGuides(String hospitalId, String uid) async {
    try {
      final data = await _repo.getCareGuides(
        hospitalId: 'hospitalId',
        uid: 'uid',
      );

      data.when(
        success: (success) {
          careGuides = success;
          debugPrint(success.toString());
          form.reset();
          notifyListeners();
          
        },
        failure: (failure) {
          debugPrint(failure.toString());
        },
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> videoGuideList() async {
    try {
      final data = await _repo.videoGuideList(pageNumber: 1);

      data.when(
        success: (success) {
          debugPrint(success.toString());
          // Perform any additional state updates here if necessary
          notifyListeners();
        },
        failure: (failure) {
          debugPrint(failure.toString());
        },
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> changeGuidePosition() async {
    try {
      final data = await _repo.changeGuideposition(position: 1, guideId: 1);

      data.when(
        success: (success) {
          debugPrint(success.toString());
          // Perform any additional state updates here if necessary
          notifyListeners();
        },
        failure: (failure) {
          debugPrint(failure.toString());
        },
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> addPageGuide() async {
    try {
      final data = await _repo.addPageGuide(guideId: 1, pageNumber: 1);

      data.when(
        success: (success) {
          debugPrint(success.toString());
          // Perform any additional state updates here if necessary
          notifyListeners();
        },
        failure: (failure) {
          debugPrint(failure.toString());
        },
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
