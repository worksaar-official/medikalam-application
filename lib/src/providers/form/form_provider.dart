// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class FormProvider extends ChangeNotifier {
  final FormGroup profileForm = FormGroup({
    'first name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'last name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'mobile': FormControl<String>(
      validators: [Validators.required, Validators.number()],
    ),
    'city': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'qualification': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'speciality': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'regi': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });

  final FormGroup registrationForm = FormGroup({
    'number': FormControl<String>(
      validators: [
        Validators.required,
        Validators.number(),
        Validators.minLength(10),
        Validators.maxLength(10),
      ],
    ),
    'name': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'dateofbirth': FormControl<String>(),
    'year': FormControl<String>(
      validators: [Validators.required, Validators.number()],
    ),
  });
}
