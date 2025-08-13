// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/views/widgets/labels/subtitle.dart';

class PersonalInfoCard extends StatelessWidget {
  final String registrationId;
  final String age;
  final String gender;
  final String mobileNumber;
  const PersonalInfoCard(
      {super.key,
      required this.registrationId,
      required this.age,
      required this.gender,
      required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Subtitle(title: "Personal Info"),
        Gap(2.5.h),
        _row(title: 'Registration ID', info: registrationId, context: context),
        _row(title: 'Age', info: age, context: context),
        _row(title: 'Gender', info: gender, context: context),
        _row(title: 'Mobile Number', info: mobileNumber, context: context),
      ],
    );
  }

  Widget _row(
      {required String title,
      required String info,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title,
                style:
                    context.textTheme.labelLarge?.copyWith(letterSpacing: -.5)),
          ),
          Expanded(
            flex: 2,
            child:
                Text(info, softWrap: true, style: context.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
