// ignore_for_file: lines_longer_than_80_chars

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/form/form_provider.dart';
import 'package:Medikalam/src/providers/registration/registration_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/buttons/radio_buttons.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';

class RegisterVisitPage extends StatefulWidget {
  const RegisterVisitPage({super.key});

  @override
  State<RegisterVisitPage> createState() => _RegisterVisitPageState();
}

class _RegisterVisitPageState extends State<RegisterVisitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: backAppbar(context, 'Register Visit'),
      body: SingleChildScrollView(
        child: Consumer<RegistrationProvider>(
          builder: (context, provider, child) {
            return ReactiveForm(
              formGroup: context.read<FormProvider>().registrationForm,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register by',
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    // CustomRadioButton(
                    //   selectedIndex: provider.selectedIndex,
                    //   index: 0,
                    //   label: 'Mobile Number',
                    //   onChanged: (v) => provider.selectRadio(v),
                    // ),
                    // CustomRadioButton(
                    //   index: 1,
                    //   label: 'Registration Number',
                    //   onChanged: (value) {
                    //     provider.selectRadio(value);
                    //   },
                    //   selectedIndex: provider.selectedIndex,
                    // ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const HelperContainer(
                      title: 'Mobile Number',
                      widget: CustomTextfield(
                        hintText: 'Enter your number',
                        formControlName: 'number',
                      ),
                    ),
                    SizedBox(width: 4.w),
                    const HelperContainer(
                      title: 'Patient Name',
                      widget: CustomTextfield(
                        hintText: 'Enter your name',
                        keyboardType: TextInputType.name,
                        formControlName: 'name',
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: HelperContainer(
                              title: 'Patient Age',
                              widget: CustomTextfield(
                                hintText: 'year',
                                keyboardType: TextInputType.number,
                                formControlName: 'year',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: HelperContainer(
                              title: '       ',
                              widget: CustomTextfield(
                                hintText: 'month',
                                formControlName: 'month',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 0.w,
                            child: Divider(
                              thickness: 1,
                              color: AppColors.txtLabel,
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          'Or',
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: AppColors.txtSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: SizedBox(
                            width: 0.w,
                            child: Divider(
                              thickness: 1,
                              color: AppColors.txtLabel,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const HelperContainer(
                      title: 'Patient Date of Birth',
                      widget: CustomTextfield(
                        hintText: 'Date of Birth',
                        formControlName: 'dateofbirth',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Text(
                      ' Select Gender',
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: AppColors.blackColor,
                      ),
                    ),
                     CustomRadioButton(
                        selectedValue: provider.selectedIndex,
                        label: 'Male',
                        onChanged: (v) => provider.selectRadio(v),
                        value: "M",
                      ),
                      CustomRadioButton(
                        selectedValue: provider.selectedIndex,
                        label: 'Female',
                        onChanged: (v) => provider.selectRadio(v),
                        value: "F",
                      ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButtonNew(
                        text: 'Attach Document',
                        onTap: () {
                          custombottomSheet(
                            context: context,
                            child: SizedBox(
                              height: 43.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                      vertical: 1.h,
                                    ),
                                    child: Text(
                                      'Attach Document',
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                        color: AppColors.documentColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  addDocumentWidget(
                                    theme: context.textTheme,
                                    img: 'assets/icons/presc.svg',
                                    title: 'Normal Presciption',
                                    desc:
                                        'You can add image of old non Medikalam prescription',
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.push(AppScreens.report.path);
                                    },
                                    child: addDocumentWidget(
                                      theme: context.textTheme,
                                      img: 'assets/icons/report.svg',
                                      title: 'Report',
                                      desc:
                                          'You can add clinical notes, vital signs, lab records files etc ',
                                    ),
                                  ),
                                  addDocumentWidget(
                                    theme: context.textTheme,
                                    img: 'assets/icons/scan.svg',
                                    title: 'Scan Document',
                                    desc:
                                        'You can add clinical notes, vital signs, lab records files etc ',
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
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
