// ignore_for_file: lines_longer_than_80_chars

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
// import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
// import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/form/form_provider.dart';
import 'package:Medikalam/src/providers/registration/registration_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
// import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/buttons/radio_buttons.dart';
// import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';
import 'package:Medikalam/src/views/widgets/qr_scanner.dart';

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
                    HelperContainer(
                      title: 'Mobile Number',
                      widget: CustomTextfield(
                        hintText: 'XXXXXXXXXX',
                        formControlName: 'number',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        prefixWidget: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 6),
                          child: Text(
                            '+91',
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.documentColor),
                          ),
                        ),
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
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: HelperContainer(
                              title: 'Year of Birth',
                              widget: CustomTextfield(
                                hintText: 'e.g. 1999',
                                keyboardType: TextInputType.number,
                                formControlName: 'year',
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                suffixWidget:
                                    ReactiveValueListenableBuilder<String>(
                                  formControlName: 'year',
                                  builder: (context, control, child) {
                                    final String? y = control.value;
                                    int? age;
                                    if (y != null && y.length == 4) {
                                      final p = int.tryParse(y);
                                      if (p != null && p > 1900) {
                                        age = 2025 - p;
                                      }
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        age != null
                                            ? '|  Age: $age'
                                            : '|  Age: --',
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                                color: AppColors.txtSecondary),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Age now shown inline in the Year of Birth field suffix and updates reactively
                    // Removed extra DOB display section and the 'Or' divider as per request
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
                    SizedBox(height: 1.h),
                    
                    // Old Prescription and Old Report buttons moved above Connect button
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 14.h,
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.offWhite,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: Center(
                              child: Text('Old Prescription Image',
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(color: AppColors.txtLabel)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 14.h,
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.offWhite,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: Center(
                              child: Text('Old Report Image',
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(color: AppColors.txtLabel)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 2.h),
                    
                    // Connect button with QR scanning functionality
                    CustomButtonNew(
                      text: 'Connect',
                      color: AppColors.green,
                      borderRadius: 12,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      onTap: () {
                        // Navigate to QR scanner
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QrScanner(),
                          ),
                        );
                      },
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
