// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/buttons/radio_buttons.dart';
import 'package:Medikalam/src/views/widgets/calendar/custom_calendar.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({super.key});

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: backAppbar(context, 'Add Patient'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Consumer<PatientProvider>(
          builder: (context, provider, child) {
            return ReactiveForm(
              formGroup: provider.form,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HelperContainer(
                      title: 'Mobile Number',
                      widget: CustomTextfield(
                        hintText: 'Enter your number',
                        formControlName: 'mobileNumber',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(2.h),
                    const HelperContainer(
                      title: 'Patient Name',
                      widget: CustomTextfield(
                        hintText: 'Enter your name',
                        keyboardType: TextInputType.name,
                        formControlName: 'name',
                      ),
                    ),
                    Gap(2.h),
                    HelperContainer(
                      title: 'Patient Date of Birth',
                      widget: CustomTextfield(
                        readOnly: true,
                        hintText: 'Date of Birth',
                        formControlName: 'dateofbirth',
                        onFieldTap: (value) {
                          datePicker(context, (value) {
                            provider.updateDate(value);
                          },
                              initialDate:
                                  provider.form.control('dateofbirth').value);
                        },
                      ),
                    ),
                    Gap(2.h),
                    Text('Select Gender',
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: AppColors.txtLabel)),
                    CustomRadioButton(
                      selectedValue: provider.form.control("gender").value,
                      label: 'Male',
                      onChanged: (v) => provider.updateGender(v),
                      value: "M",
                    ),
                    CustomRadioButton(
                      selectedValue: provider.form.control("gender").value,
                      label: 'Female',
                      onChanged: (v) => provider.updateGender(v),
                      value: "F",
                    ),
                    const Spacer(),
                    CustomButtonNew(
                      margin: EdgeInsets.only(bottom: 2.h),
                      text: 'Add Patient',
                      onTap: () {
                        if (provider.form.valid) {
                          final data = {
                            "fullName": provider.form.control("name").value,
                            "mobileNumber":
                                provider.form.control("mobileNumber").value,
                            "gender": provider.form.control("gender").value,
                            "age": (provider.form.control("dateofbirth").value
                                    as DateTime)
                                .age
                                .toString()
                          };
                          provider.createEntity(context, data);
                        } else {
                          logger.e(provider.form.errors);
                          provider.form.markAllAsTouched();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
