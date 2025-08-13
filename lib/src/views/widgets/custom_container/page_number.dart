// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

Widget pageNumber(BuildContext context, int pageNumber) {
  return Container(
    margin: EdgeInsets.only(top: 1.5.h, bottom: .5.h),
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
    decoration: BoxDecoration(
        color: AppColors.lightSky, borderRadius: BorderRadius.circular(38)),
    child: Text(
      "Page $pageNumber",
      style: context.textTheme.displaySmall?.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.txtPrimary),
    ),
  );
}
