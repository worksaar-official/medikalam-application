// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

class CustomButtonNew extends StatelessWidget {
  const CustomButtonNew({
    this.text,
    this.color,
    this.iconColor,
    this.style,
    this.onTap,
    this.outlineBtn,
    this.borderRadius,
    this.icon,
    this.iconSize,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,
    this.shadows,
    this.status,
    super.key,
  });
  final String? text;
  final Color? color;
  final Color? iconColor;
  final TextStyle? style;
  final VoidCallback? onTap;
  final bool? outlineBtn;
  final double? borderRadius;
  final IconData? icon;
  final double? iconSize;
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadows;
  final SubmissionStatus? status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (status != null && status == SubmissionStatus.submitting)
            ? null
            : onTap?.call();
      },
      splashColor: Colors.transparent,
      child: Container(
        height: height ?? 6.h,
        width: width ?? 100.w,
        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: shadows,
          color: color ?? AppColors.btnPrimary,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        ),
        child:
            child ?? (status != null ? _handleState(context) : _btn(context)),
      ),
    );
  }

  Widget _btn(BuildContext context) {
    return Center(
      child: Text(
        text ?? 'View',
        style: style ??
            context.textTheme.labelLarge?.copyWith(
                color: AppColors.buttonText, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _handleState(BuildContext context) {
    late Widget child;
    switch (status) {
      case SubmissionStatus.submitting:
        child =
            const Center(child: CircularProgressIndicator(color: Colors.white));
        break;
      case SubmissionStatus.success:
      case SubmissionStatus.error:
        child = _btn(context);
        break;
      default:
        child = _btn(context);
        break;
    }
    return child;
  }
}

Widget numberButtons({
  required String text,
  required VoidCallback ontap,
  required TextTheme theme,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: 10.w,
        // height: 3.h,
        decoration: BoxDecoration(color: AppColors.lightSky),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: theme.bodyMedium!.copyWith(color: AppColors.blackColor),
          ),
        ),
      ),
    ),
  );
}

Widget textButtons({
  required String text,
  required VoidCallback ontap,
  required TextTheme theme,
  Color? color,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: 18.w,
        // height: 3.h,
        decoration: BoxDecoration(color: color ?? AppColors.lightSky),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: theme.bodyMedium!
                .copyWith(color: AppColors.blackColor, fontSize: 12.sp),
          ),
        ),
      ),
    ),
  );
}

Widget mobileButtons({
  required String text,
  required VoidCallback ontap,
  required TextTheme theme,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: 8.w,
        // height: 3.h,
        decoration: BoxDecoration(
          color: AppColors.contPrimary,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: theme.bodyMedium!
                .copyWith(color: AppColors.txtPrimary, fontSize: 12.sp),
          ),
        ),
      ),
    ),
  );
}

Widget iconButtons({
  required IconData icon,
  required VoidCallback ontap,
  required TextTheme theme,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Container(
        width: 10.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: AppColors.lightSky,
          // borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          color: AppColors.blackColor,
          size: 15,
        ),
      ),
    ),
  );
}
