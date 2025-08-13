// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/bar.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';

Future<void> successBookingSheet(BuildContext context, String name, String time,
    String date, Function() onClose) async {
  custombottomSheet(
    context: context,
    onClose: onClose,
    child: SizedBox(
      height: 50.h,
      child: Column(
        children: [
          bar(),
          SvgPicture.asset(
            'assets/images/success.svg',
            height: 22.5.h,
            width: 100.w,
          ),
          Gap(2.h),
          Text(
            'Appointment is Booked',
            style: context.textTheme.displaySmall?.copyWith(fontSize: 18.sp),
          ),
          Gap(4.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: AppColors.documentColor),
                    ),
                    Text(
                      date,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                    color: AppColors.btnPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(time,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.lightSky)),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomButtonNew(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              onTap: () {
                onClose();
              },
              text: 'Done'),
        ],
      ),
    ),
  );
}
