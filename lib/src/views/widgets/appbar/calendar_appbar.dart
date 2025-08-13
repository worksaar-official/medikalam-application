// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/views/widgets/calendar/calender.dart';

PreferredSize calendarAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(10.h),
    child: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF7F7F7), Color(0xFFF9F9F9)],
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 2)),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        bottom: const PreferredSize(
            preferredSize: Size.zero, child: StartingDatesRow()),
      ),
    ),
  );
}
