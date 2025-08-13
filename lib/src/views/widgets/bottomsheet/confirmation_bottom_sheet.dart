// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/bar.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';

Future<void> confirmSheet(
    {required String title,
    required BuildContext context,
    required Function() onDelete}) {
  return showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bar(),
                      Text(
                        title,
                        style: context.textTheme.displaySmall
                            ?.copyWith(fontSize: 18.sp),
                      ),
                      Text(
                        "Are you sure you want to delete?",
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: AppColors.lightGrey),
                      ),
                      Gap(2.h),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Expanded(
                            child: CustomButtonNew(
                                text: "Yes",
                                onTap: onDelete,
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.redText,
                                  fontSize: 16.sp,
                                ),
                                color: AppColors.redBtn)),
                        Gap(4.w),
                        Expanded(
                            child: CustomButtonNew(
                          text: "No",
                          onTap: () {
                            context.pop();
                          },
                        ))
                      ])
                    ]),
              ),
            ),
          );
        });
      });
}
