// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

Widget calendar(BuildContext context,
    {required DateTime focusedDay,
    required bool Function(DateTime date)? selectedDayPredicate,
    required Function(DateTime, DateTime)? onDaySelected}) {
  return TableCalendar(
    firstDay: DateTime.now(),
    lastDay: DateTime.now().add(const Duration(days: 90)),
    focusedDay: focusedDay,
    selectedDayPredicate: selectedDayPredicate,
    onDaySelected: onDaySelected,
    calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultTextStyle: context.textTheme.bodyMedium!
            .copyWith(color: AppColors.calendarColor),
        weekendTextStyle: context.textTheme.bodyMedium!
            .copyWith(color: AppColors.calendarColor),
        selectedTextStyle:
            context.textTheme.bodyMedium!.copyWith(color: Colors.white),
        selectedDecoration:
            BoxDecoration(color: AppColors.btnPrimary, shape: BoxShape.circle)),
    daysOfWeekStyle: DaysOfWeekStyle(
      weekdayStyle:
          context.textTheme.bodyMedium!.copyWith(color: AppColors.calendarDay),
      weekendStyle:
          context.textTheme.bodyMedium!.copyWith(color: AppColors.calendarDay),
    ),
    headerStyle: HeaderStyle(
        headerPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        leftChevronVisible: false,
        rightChevronVisible: false,
        formatButtonVisible: false,
        titleTextStyle: context.textTheme.bodyLarge!
            .copyWith(color: AppColors.documentColor, fontSize: 18.sp)),
  );
}
