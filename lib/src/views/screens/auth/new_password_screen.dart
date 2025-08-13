// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/auth/auth_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/auth_appbar.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: authAppbar(context, 'Set Password'),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return ReactiveForm(
            formGroup: provider.form,
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Set new password',
                          style: context.textTheme.titleLarge),
                      SizedBox(height: 3.h),
                      const HelperContainer(
                        title: 'New Password',
                        widget: CustomTextfield(
                          hintText: 'Enter your password',
                          formControlName: 'password',
                          type: 'password',
                          isPassword: true,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      const HelperContainer(
                        title: 'Confirm password',
                        widget: CustomTextfield(
                          type: 'password',
                          hintText: 'Enter your password',
                          formControlName: 'confirmPassword',
                          isPassword: true,
                        ),
                      ),
                      const Spacer(),
                      CustomButtonNew(
                        text: 'Reset',
                        onTap: () async {},
                      ),
                      Gap(2.h)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
