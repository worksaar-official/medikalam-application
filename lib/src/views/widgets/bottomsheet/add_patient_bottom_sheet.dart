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
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/buttons/radio_buttons.dart';
import 'package:Medikalam/src/views/widgets/calendar/custom_calendar.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';

Future<void> newPatientBottomSheet(BuildContext context) async {
  final patientProvider = context.read<PatientProvider>();
  patientProvider.showPrescription = true;
  patientProvider.form.reset();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return ChangeNotifierProvider.value(
        value: patientProvider,
        child: Container(
          height: MediaQuery.of(ctx).size.height * 0.85,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 1.h),
                width: 10.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: AppColors.txtLabel.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add New Patient',
                      style: ctx.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(ctx),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Form Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Consumer<PatientProvider>(
                    builder: (c, provider, child) {
                      return ReactiveForm(
                        formGroup: provider.form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HelperContainer(
                              title: 'Mobile Number',
                              widget: CustomTextfield(
                                hintText: 'Enter mobile number',
                                formControlName: 'mobileNumber',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Gap(2.h),
                            const HelperContainer(
                              title: 'Patient Name',
                              widget: CustomTextfield(
                                hintText: 'Enter patient name',
                                keyboardType: TextInputType.name,
                                formControlName: 'name',
                              ),
                            ),
                            Gap(2.h),
                            HelperContainer(
                              title: 'Date of Birth',
                              widget: CustomTextfield(
                                readOnly: true,
                                hintText: 'Select date of birth',
                                formControlName: 'dateofbirth',
                                onFieldTap: (v) {
                                  provider.form
                                      .control('dateofbirth')
                                      .markAsTouched();
                                  datePicker(
                                    ctx,
                                    (date) {
                                      provider.updateDate(date);
                                    },
                                    initialDate: provider.form
                                        .control('dateofbirth')
                                        .value,
                                  );
                                },
                              ),
                            ),
                            if (provider.form.control('dateofbirth').invalid &&
                                provider.form
                                    .control('dateofbirth')
                                    .touched) ...[
                              Gap(1.h),
                              Text(
                                'Date of birth is required',
                                style: ctx.textTheme.bodySmall
                                    ?.copyWith(color: Colors.red),
                              ),
                            ],
                            Gap(2.h),
                            Text(
                              'Select Gender',
                              style: ctx.textTheme.bodyLarge
                                  ?.copyWith(color: AppColors.txtLabel),
                            ),
                            Gap(1.h),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomRadioButton(
                                    selectedValue:
                                        provider.form.control('gender').value ??
                                            '',
                                    label: 'Male',
                                    onChanged: (v) {
                                      provider.updateGender(v);
                                      provider.form
                                          .control('gender')
                                          .markAsTouched();
                                    },
                                    value: 'M',
                                  ),
                                ),
                                Expanded(
                                  child: CustomRadioButton(
                                    selectedValue:
                                        provider.form.control('gender').value ??
                                            '',
                                    label: 'Female',
                                    onChanged: (v) {
                                      provider.updateGender(v);
                                      provider.form
                                          .control('gender')
                                          .markAsTouched();
                                    },
                                    value: 'F',
                                  ),
                                ),
                              ],
                            ),
                            if (provider.form.control('gender').invalid &&
                                provider.form.control('gender').touched) ...[
                              Gap(1.h),
                              Text(
                                'Please select gender',
                                style: ctx.textTheme.bodySmall
                                    ?.copyWith(color: Colors.red),
                              ),
                            ],
                            Gap(3.h),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Bottom Button
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(13),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Consumer<PatientProvider>(
                  builder: (c, provider, child) {
                    return CustomButtonNew(
                      text: 'Add Patient & Link',
                      onTap: () async {
                        if (provider.form.valid) {
                          final dob = provider.form.control('dateofbirth').value
                              as DateTime;
                          final data = {
                            "fullName": provider.form.control("name").value,
                            "mobileNumber":
                                provider.form.control("mobileNumber").value,
                            "gender": provider.form.control("gender").value,
                            "age": dob.age.toString(),
                          };
                          provider.createEntity(context, data);
                        } else {
                          logger.e(provider.form.errors);
                          provider.form.markAllAsTouched();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
