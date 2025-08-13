// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';

Widget careGuideWidget({
  required String title,
  required String desc,
  required TextTheme theme,
}) {
  return Container(
    padding: const EdgeInsets.all(9),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.offWhite,
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.bodyMedium!.copyWith(
                color: AppColors.documentColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 70.w,
              child: Text(
                desc,
                style: theme.bodyMedium!.copyWith(
                  color: AppColors.txtLabel,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
