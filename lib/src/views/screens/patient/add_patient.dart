// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                    HelperContainer(
                      title: 'Mobile Number',
                      widget: CustomTextfield(
                        hintText: 'Enter your number',
                        formControlName: 'mobileNumber',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        prefixWidget: const Text('+91 '),
                        validationMessages: {
                          'minLength': (error) =>
                              'Mobile number must be 10 digits',
                          'maxLength': (error) =>
                              'Mobile number must be 10 digits',
                        },
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
                    SizedBox(height: 0.8.h),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => provider.updateGender('M'),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color:
                                      provider.form.control('gender').value ==
                                              'M'
                                          ? const Color(0xFF3B82F6)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow:
                                      provider.form.control('gender').value ==
                                              'M'
                                          ? [
                                              BoxShadow(
                                                color: const Color(0xFF3B82F6)
                                                    .withOpacity(0.3),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ]
                                          : null,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.male,
                                      size: 16,
                                      color: provider.form
                                                  .control('gender')
                                                  .value ==
                                              'M'
                                          ? Colors.white
                                          : Colors.grey[600],
                                    ),
                                    SizedBox(width: 1.w),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: provider.form
                                                    .control('gender')
                                                    .value ==
                                                'M'
                                            ? Colors.white
                                            : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => provider.updateGender('F'),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color:
                                      provider.form.control('gender').value ==
                                              'F'
                                          ? const Color(0xFFEC4899)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow:
                                      provider.form.control('gender').value ==
                                              'F'
                                          ? [
                                              BoxShadow(
                                                color: const Color(0xFFEC4899)
                                                    .withOpacity(0.3),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ]
                                          : null,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.female,
                                      size: 16,
                                      color: provider.form
                                                  .control('gender')
                                                  .value ==
                                              'F'
                                          ? Colors.white
                                          : Colors.grey[600],
                                    ),
                                    SizedBox(width: 1.w),
                                    Text(
                                      'Female',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: provider.form
                                                    .control('gender')
                                                    .value ==
                                                'F'
                                            ? Colors.white
                                            : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
