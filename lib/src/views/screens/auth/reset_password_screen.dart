// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

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

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: authAppbar(context, 'Reset Password'),
      body: ReactiveForm(
        formGroup: context.read<AuthProvider>().form,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset Password',
                    style: context.textTheme.titleLarge,
                  ),
                  Text('Enter your registered email',
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: AppColors.hexToColor("#828282"))),
                  SizedBox(height: 2.h),
                  const HelperContainer(
                    title: 'Email',
                    widget: CustomTextfield(
                      hintText: 'Enter your email',
                      formControlName: 'email',
                    ),
                  ),
                  const Spacer(),
                  CustomButtonNew(
                    text: 'Send Link',
                    onTap: () {
                      context.push(AppScreens.newPassword.path);
                    },
                  ),
                  Gap(2.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
