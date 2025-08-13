// Flutter imports:

// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:Medikalam/services/api/auth/auth_repo.dart';
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/models/auth/login_response.dart';

@injectable
class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _initForms();
    _initUser();
  }

  final AuthRepo _repo = getIt<AuthRepo>();
  User? _user;

  // Define forms here
  FormGroup form = FormGroup({});
  FormGroup userProfileForm = FormGroup({});
  FormGroup loginForm = FormGroup({});
  SubmissionStatus _submissionStatus = SubmissionStatus.initial;

  // Getters
  User? get user => _user;
  SubmissionStatus get getSubmissionStatus => _submissionStatus;

  void setSubmissionStatus(SubmissionStatus status) {
    _submissionStatus = status;
    notifyListeners();
  }

  void _initForms() {

    userProfileForm = FormGroup({
      '_id': FormControl<String>(), 
      'fullName': FormControl<String>(),
      'firstName': FormControl<String>(),
      'lastName': FormControl<String>(),
      'mobileNumber': FormControl<int>(),
      'email': FormControl<String>(
        validators: [Validators.email],
      ),
      'displayPicture': FormControl<String>(),
      'type': FormControl<String>(),
      'title': FormControl<String>(),
      'hospital': FormControl<String>(),
    });

    form = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      'confirmPassword': FormControl<String>(
        validators: [
          const MustMatchValidator('password', 'confirmPassword', true)
        ],
      ),
    });

    loginForm = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    });
  }

  void setUser(User newUser){
    _user = newUser;
    userProfileForm.patchValue({
      '_id': newUser.id,
      'fullName': newUser.fullName,
      'firstName': newUser.firstName,
      'lastName': newUser.lastName,
      'mobileNumber': newUser.mobileNumber,
      'email': newUser.email,
      'displayPicture': newUser.displayPicture,
      'type': newUser.type,
      'title': newUser.title,
      'hospital': newUser.hospital.name,
    });
    notifyListeners();
  }

  void _initUser(){
    final user = Helpers.getString(key: Keys.user);
    if(user != null){
      setUser(User.fromJson(jsonDecode(user)));
    }
  }
  /// Update Doctor info
  Future<void> updateUser()async{
    logger.d('Updating user info');
    try {
      setSubmissionStatus(SubmissionStatus.submitting);
      final updateUser = User(
        id: userProfileForm.value['_id'] as String? ?? '',
        fullName: userProfileForm.value['fullName'] as String? ?? '',
        firstName: userProfileForm.value['firstName'] as String? ?? '',
        lastName: userProfileForm.value['lastName'] as String? ?? '',
        mobileNumber: userProfileForm.value['mobileNumber'] as int? ?? 0,
        email: userProfileForm.value['email'] as String? ?? '',
        displayPicture: userProfileForm.value['displayPicture'] as String? ?? '',
        type: userProfileForm.value['type'] as String? ?? '',
        title: userProfileForm.value['title'] as String? ?? '',
        hospital: Hospital(
          name: userProfileForm.value['hospital'] as String? ?? '',
        ),
      );
      final data = await _repo.update(updateUser);
      data.when(
        success: (success) {
          setSubmissionStatus(SubmissionStatus.success);
          Helpers.setString(key: Keys.user, value: jsonEncode(success.toJson()));
          setUser(success);
          showSuccess('Profile updated successfully');
        },
        failure: (failure) {
          setSubmissionStatus(SubmissionStatus.error);
          showError(failure.toString());
        },
      );
    } catch (e, s) {
      setSubmissionStatus(SubmissionStatus.error);
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  Future<void> staffLogin(BuildContext context) async {
    try {
      setSubmissionStatus(SubmissionStatus.submitting);
      final data = await _repo.login(
        email: loginForm.value['email'] as String,
        password: loginForm.value['password'] as String,
      );
      setSubmissionStatus(SubmissionStatus.success);
      data.when(
        success: (success) {
          Helpers.setString(key: Keys.token, value: success.jwt);
          Helpers.setToken(success.jwt);
          Helpers.setString(key: Keys.user, value: jsonEncode(success.user.toJson()));
          setUser(success.user);
          showSuccess('Logged in successfully');
          GoRouter.of(context).goNamed(AppScreens.dashboard.name);
        },
        failure: (failure) {
          showError(failure.toString());
        },
      );
    } catch (e, s) {
      setSubmissionStatus(SubmissionStatus.error);
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
