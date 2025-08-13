// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';

class PrescriptionHeaderUi extends StatelessWidget {
  const PrescriptionHeaderUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 47.w,
          height: 8.5.h,
          decoration: BoxDecoration(
            color: AppColors.lightSky,
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(85),
              bottomLeft: Radius.circular(90.sp),
            ),
          ),
        ),
        Positioned(
          top: 0.1,
          child: Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Container(
              width: 40.w,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.backgroundPrimary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomLeft: Radius.circular(70),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Text(
                    'Dr. Ashray Mangal',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Dermatologist | MBBS',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 7, color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
