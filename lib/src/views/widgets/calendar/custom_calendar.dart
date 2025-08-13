// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/bar.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';

Future<void> datePicker(
    BuildContext context, ValueChanged<DateTime> onDateSelected,
    {DateTime? initialDate}) async {
  custombottomSheet(
      context: context,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                bar(),
                Gap(20.w),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Done",
                      style: context.textTheme.titleSmall
                          ?.copyWith(fontSize: 16.sp),
                    ))
              ],
            ),
            SizedBox(
              height: 25.h,
              child: CupertinoDatePicker(
                initialDateTime: initialDate ?? DateTime.now(),
                maximumDate: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDate) {
                  onDateSelected(
                      newDate); // Notify the callback of the new date
                },
              ),
            ),
          ],
        ),
      ));
  // DateTime? selectedDate = await showCupertinoModalPopup<DateTime>(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return Container(
  //       height: 32.h,
  //       color: Colors.white,
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: 200,
  //             child: CupertinoDatePicker(
  //               initialDateTime: DateTime.now(),
  //               mode: CupertinoDatePickerMode.date,
  //               onDateTimeChanged: (DateTime newDate) {
  //                 onDateSelected(
  //                     newDate); // Notify the callback of the new date
  //               },
  //             ),
  //           ),
  //           CupertinoButton(
  //             child: const Text('Done'),
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the popup
  //             },
  //           ),
  //         ],
  //       ),
  //     );
  //   },
  // );

  // if (selectedDate != null) {
  //   onDateSelected(selectedDate); // Finalize the date selection
  // }
}
