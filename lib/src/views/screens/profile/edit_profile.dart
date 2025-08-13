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
import 'package:Medikalam/src/providers/auth/auth_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/label_widget.dart';
import '../../widgets/textfield/custom_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: backAppbar(context, 'Edit Profile'),
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return ReactiveForm(
              formGroup: provider.userProfileForm,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Info',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.blackColor,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const HelperContainer(
                      title: 'First Name',
                      widget: CustomTextfield(
                        hintText: 'First Name',
                        formControlName: 'firstName',
                      ),
                    ),
                    const HelperContainer(
                      title: 'Last Name',
                      widget: CustomTextfield(
                        hintText: 'Last Name',
                        formControlName: 'lastName',
                      ),
                    ),
                    const HelperContainer(
                      title: 'Email',
                      widget: CustomTextfield(
                        hintText: 'Email',
                        formControlName: 'email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const HelperContainer(
                      title: 'Mobile Number',
                      widget: CustomTextfield(
                        hintText: 'Mobile',
                        formControlName: 'mobileNumber',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    // const HelperContainer(
                    //   title: 'City',
                    //   widget: CustomTextfield(
                    //     hintText: 'City',
                    //     formControlName: 'name',
                    //   ),
                    // ),
                    // const HelperContainer(
                    //   title: 'Qualification',
                    //   widget: CustomTextfield(
                    //     hintText: 'Qualification',
                    //     formControlName: 'name',
                    //   ),
                    // ),
                    const HelperContainer(
                      title: 'Speciality',
                      widget: CustomTextfield(
                        hintText: 'Speciality',
                        formControlName: 'title',
                      ),
                    ),
                    const HelperContainer(
                      title: 'Hospital',
                      widget: CustomTextfield(
                        hintText: 'Hospital',
                        formControlName: 'hospital',
                      ),
                    ),
                    // const HelperContainer(
                    //   title: 'Registration Number',
                    //   widget: CustomTextfield(
                    //     hintText: 'Registration Number',
                    //     formControlName: 'name',
                    //     keyboardType: TextInputType.number,
                    //   ),
                    // ),
                    Gap(2.h),
                    CustomButtonNew(
                      text: 'Save Info',
                      onTap: () async{
                        await provider.updateUser();    
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
