// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/auth/auth_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/auth_appbar.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: authAppbar(context, 'Log In'),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return ReactiveForm(
            formGroup: provider.loginForm,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 6.w),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Let's sign you in.",
                        style: context.textTheme.titleLarge),
                    SizedBox(height: 4.h),
                    const HelperContainer(
                      title: 'Email',
                      widget: CustomTextfield(
                        hintText: 'Enter your email',
                        formControlName: 'email',
                      ),
                    ),
                    SizedBox(height: 2.h),
                    HelperContainer(
                      title: 'Password',
                      widget: CustomTextfield(
                        type: 'password',
                        hintText: 'Enter your password',
                        formControlName: 'password',
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: (form) {
                          handleLogin(context, provider);
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(AppScreens.resetPassword.path);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Reset Password',
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: AppColors.txtPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    if (kDebugMode)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            final form = provider.loginForm;
                            form
                                .control('email')
                                .updateValue('example@gmail.com');
                            form.control('password').updateValue('ashray123');
                          },
                          child: const Text('Autofill (temp)'),
                        ),
                      ),
                    SizedBox(height: 4.h),
                    CustomButtonNew(
                        status: provider.getSubmissionStatus,
                        text: 'Log In',
                        onTap: () {
                          handleLogin(context, provider);
                        }),
                    Gap(2.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> handleLogin(BuildContext context, AuthProvider provider) async {
    if (!provider.loginForm.valid) {
      provider.loginForm.markAllAsTouched();
    } else {
      await provider.staffLogin(context);
    }
  }
}
