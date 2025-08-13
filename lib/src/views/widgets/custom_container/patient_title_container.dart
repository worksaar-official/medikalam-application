// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

class PatientTitle extends StatelessWidget {
  final String title;
  final String title1;
  final VoidCallback onTap;
  const PatientTitle(
      {super.key,
      required this.title,
      required this.title1,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.txtPrimary),
                ),
                Text(
                  title1,
                  style:
                      context.textTheme.labelMedium?.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: onTap,
                child: SizedBox.square(
                    dimension: 5.h,
                    child: SvgPicture.asset("assets/icons/call.svg")),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
