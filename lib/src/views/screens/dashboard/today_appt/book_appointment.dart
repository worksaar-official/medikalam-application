// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/constant.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/datetime/calendar.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppbar(context, 'Book Appointment'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: Consumer<AppointmentProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  calendar(
                    context,
                    focusedDay: provider.form.control("appt_date").value,
                    selectedDayPredicate: (date) =>
                        isSameDay(provider.form.control("appt_date").value, date),
                    onDaySelected: (selectedDay, focusedDay) {
                      provider.updateDate(selectedDay);
                    },
                  ),
                  Divider(height: 2.h),
                  Text("Appointment Slots",
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.documentColor, fontSize: 18.sp)),
                  Gap(2.h),
                  Wrap(
                    spacing: 2.5.w,
                    runSpacing: 1.h,
                    children: List.generate(Constants.slots.length, (index) {
                      final time = Constants.slots[index];
                      return _slot(time, () {
                        provider.updateTime(time);
                      },
                          isSelected:
                              provider.form.control("appt_time").value == time);
                    }),
                  ),
                  Gap(2.h),
                  CustomButtonNew(
                    text: 'Book Appointment',
                    status: provider.submissionStatus,
                    onTap: () async {
                      await provider.submit(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _slot(String time, Function() onTap, {bool isSelected = false}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Container(
          key: ValueKey<bool>(isSelected),
          width: 20.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightSky : AppColors.contPrimary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              time,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: isSelected ? AppColors.txtPrimary : AppColors.subTitle,
                  fontSize: 15.sp),
            ),
          ),
        ),
      ),
    );
  }
}
