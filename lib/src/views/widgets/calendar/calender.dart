// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';
import 'package:Medikalam/src/views/widgets/calendar/popup_buttons/body_btn.dart';
import 'package:Medikalam/src/views/widgets/calendar/popup_buttons/header_btn.dart';

class StartingDatesRow extends StatefulWidget {
  const StartingDatesRow({super.key});

  @override
  State<StartingDatesRow> createState() => _StartingDatesRowState();
}

class _StartingDatesRowState extends State<StartingDatesRow> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedDate();
    });
  }

  void _scrollToSelectedDate() {
    final provider = context.read<AppointmentProvider>();
    final selectedIndex = provider.daysInMonth
        .indexWhere((day) => day['date'] == provider.date.toString());

    if (selectedIndex != -1) {
      final itemOffset = selectedIndex * (15.w + 2.5.w); // item width + margin
      _scrollController.jumpTo(itemOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 8.h,
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.daysInMonth.length,
                    itemBuilder: (context, index) {
                      final date =
                          provider.daysInMonth[index]['date'] as String;
                      final day = provider.daysInMonth[index]['day'] as String;
                      final selected = date == provider.date.toString();
                      return GestureDetector(
                        onTap: () {
                          provider.setDate(date);
                        },
                        child: _container(
                          selected ? AppColors.btnPrimary : AppColors.offWhite,
                          selected
                              ? AppColors.backgroundPrimary
                              : AppColors.hexToColor("#F0F0F0"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                date,
                                style: context.textTheme.bodyLarge?.copyWith(
                                    color: selected
                                        ? AppColors.navShadow
                                        : AppColors.txtLabel),
                              ),
                              Text(
                                day,
                                style: context.textTheme.bodyMedium?.copyWith(
                                    color: selected
                                        ? AppColors.navShadow
                                        : AppColors.subTitle),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: AppColors.white,
                position: PopupMenuPosition.under,
                menuPadding: EdgeInsets.zero,
                constraints: BoxConstraints(maxWidth: 30.w),
                itemBuilder: (context) {
                  return [
                    headerBtn(context),
                    bodyBtn(context),
                  ];
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.7.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightSky,
                    border: Border.all(color: AppColors.lightSky),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Helpers.getMonthAbbreviation(provider.month),
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textPrimary, fontSize: 15.sp),
                      ),
                      Gap(.5.h),
                      Text(
                        provider.year.toString(),
                        style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.textPrimary, fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _container(Color color, Color borderColor, Widget child) {
    return Container(
      width: 15.w,
      margin: EdgeInsets.symmetric(horizontal: 1.5.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
