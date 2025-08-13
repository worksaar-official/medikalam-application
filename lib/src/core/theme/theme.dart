// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Inter',
    iconTheme: IconThemeData(color: AppColors.iconPrimary),
    dividerTheme:
        DividerThemeData(thickness: 1.2, color: AppColors.dividerPrimary),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide.none,
      checkColor: WidgetStateProperty.all(Colors.white),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.txtWhite;
        } else {
          return AppColors.lightSolid;
        }
      }),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      scrolledUnderElevation: 0,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.iconPrimary, size: 4.h),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 27.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 24.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 22.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        color: AppColors.txtLabel,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: AppColors.txtLabel,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: AppColors.documentColor,
        fontWeight: FontWeight.w600,
        letterSpacing: -.15,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: AppColors.documentColor,
        fontWeight: FontWeight.w600,
        letterSpacing: -.15,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.documentColor,
        fontWeight: FontWeight.w600,
        letterSpacing: -.15,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        color: AppColors.subTitle,
        fontWeight: FontWeight.w500,
        letterSpacing: -.15,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        color: AppColors.subTitle,
        fontWeight: FontWeight.w500,
        letterSpacing: -.15,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.subTitle,
        fontWeight: FontWeight.w500,
        letterSpacing: -.15,
      ),
    ),
  );
}
