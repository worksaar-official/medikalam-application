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
      backgroundColor: const Color(0xFFF8FAFC),
      resizeToAvoidBottomInset: true,
      appBar: backAppbar(context, 'Register Visit'),
      body: SingleChildScrollView(
        child: Consumer<RegistrationProvider>(
          builder: (context, provider, child) {
            return ReactiveForm(
              formGroup: context.read<FormProvider>().registrationForm,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header section with simple styling
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2563EB).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.medical_services_rounded,
                                  color: Color(0xFF2563EB),
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                'Patient Registration',
                                style: context.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.2.h),

                          // Mobile Number field
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
                              prefixWidget: Container(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  '+91',
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    color: const Color(0xFF2563EB),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 1.2.h),

                          // Patient Name field
                          const HelperContainer(
                            title: 'Patient Name',
                            widget: CustomTextfield(
                              hintText: 'Enter patient name',
                              keyboardType: TextInputType.name,
                              formControlName: 'name',
                            ),
                          ),

                          SizedBox(height: 1.2.h),

                          // Year of Birth with age calculation
                          HelperContainer(
                            title: 'Year of Birth',
                            widget: CustomTextfield(
                              hintText: 'e.g. 1999',
                              keyboardType: TextInputType.number,
                              formControlName: 'year',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                              suffixWidget: Container(
                                padding: const EdgeInsets.only(right: 8),
                                child: ReactiveValueListenableBuilder<String>(
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
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: age != null
                                            ? const Color(0xFF10B981)
                                                .withOpacity(0.1)
                                            : const Color(0xFF6B7280)
                                                .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        age != null ? 'Age: $age' : 'Age: --',
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                          color: age != null
                                              ? const Color(0xFF10B981)
                                              : const Color(0xFF6B7280),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.5.h),

                    // Gender selection with simple styling
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF7C3AED).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: Color(0xFF7C3AED),
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                'Patient Gender',
                                style: context.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Expanded(
                                child: CustomRadioButton(
                                  selectedValue: provider.selectedIndex,
                                  label: 'Male',
                                  onChanged: (v) => provider.selectRadio(v),
                                  value: "M",
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: CustomRadioButton(
                                  selectedValue: provider.selectedIndex,
                                  label: 'Female',
                                  onChanged: (v) => provider.selectRadio(v),
                                  value: "F",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.5.h),

                    // Medical Documents section with simple design
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF059669).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.folder_rounded,
                                  color: Color(0xFF059669),
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                'Medical Documents',
                                style: context.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 8.h,
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0F9FF),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xFF0EA5E9)
                                            .withOpacity(0.2),
                                        width: 1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.description_outlined,
                                        size: 20,
                                        color: const Color(0xFF0EA5E9),
                                      ),
                                      SizedBox(height: 0.5.h),
                                      Text(
                                        'Previous Prescription',
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                          color: const Color(0xFF0C4A6E),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 8.h,
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0FDF4),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xFF10B981)
                                            .withOpacity(0.2),
                                        width: 1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.assessment_outlined,
                                        size: 20,
                                        color: const Color(0xFF10B981),
                                      ),
                                      SizedBox(height: 0.5.h),
                                      Text(
                                        'Medical Reports',
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                          color: const Color(0xFF064E3B),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 2.h),

                    // Connect button with simple styling
                    CustomButtonNew(
                      text: 'Connect & Scan QR',
                      color: const Color(0xFF2563EB),
                      borderRadius: 12,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
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

                    SizedBox(height: 2.h),
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
