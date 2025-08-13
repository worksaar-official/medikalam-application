// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';

Widget actionCard({
  required String icon,
  required String title,
  required VoidCallback onTap,
  required TextTheme theme,
}) {
  String getTextWithLineBreaks(String text) {
    return text.split(' ').join('\n');
  }

  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon, height: 4.h),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                getTextWithLineBreaks(title),
                style: theme.bodyMedium!.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget PatientCard(
    {required String title,
    required String desc,
    required TextTheme theme,
    Function()? onTap,
    Function()? onLink,
    bool divider = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DecoratedBox(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.bodyLarge),
                  Gap(.2.h),
                  Text(desc,
                      style: theme.labelMedium?.copyWith(fontSize: 14.5.sp)),
                ],
              ),
            ),
            GestureDetector(
              onTap: onLink,
              child: SizedBox.square(
                  dimension: 6.h,
                  child: SvgPicture.asset('assets/icons/appoint.svg')),
            ),
          ],
        ),
      ),
      if (divider) Divider(height: 2.h)
    ],
  );
}

Widget appointHeader({
  required String title,
  required String title1,
  required TextTheme theme,
  String? icon,
  VoidCallback? ontap,
}) {
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
                style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                title1,
                style: theme.titleMedium
                    ?.copyWith(color: AppColors.txtPrimary, fontSize: 19.sp),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.hexToColor("#E6E6E6"),
                  offset: const Offset(0, 2), // Position of the shadow
                  blurRadius: 10, // Softness of the shadow
                  spreadRadius: 1, // Spread of the shadow
                ),
              ],
            ),
            child: icon != null
                ? GestureDetector(
                    onTap: ontap,
                    child: SvgPicture.asset(
                      icon,
                      height: 6.h,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    ],
  );
}

Widget headerShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 15,
                  color: Colors.grey,
                ),
                const SizedBox(height: 5),
                Container(
                  width: 150,
                  height: 20,
                  color: Colors.grey,
                ),
              ],
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget addDocumentWidget({
  required String img,
  required String title,
  required TextTheme theme,
  String? desc,
}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.offWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            img,
            color: AppColors.documentColor,
            height: 30,
            width: 25,
          ),
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
                  desc!,
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
    ),
  );
}

Widget profileInfoWidget({
  required String title,
  required String info,
  required TextTheme theme,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          title,
          style: theme.bodyMedium!
              .copyWith(color: AppColors.lightGrey, fontSize: 13),
        ),
      ),
      Expanded(
        child: Text(
          info,
          softWrap: true,
          style: theme.bodyMedium!
              .copyWith(color: AppColors.blackColor, fontSize: 13),
        ),
      ),
    ],
  );
}
