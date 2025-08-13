// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/constant.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';

PopupMenuItem bodyBtn(BuildContext context) {
  return PopupMenuItem(
    padding: EdgeInsets.zero,
    child: Consumer<AppointmentProvider>(
      builder: (context, provide, state) {
        final years = Helpers.generateYears();
        return Container(
          height: 25.h,
          color: AppColors.white,
          width: 100.w,
          child: provide.showYear
              ? ListView.builder(
                  itemCount: years.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final selected = years[index] == provide.year;
                    final data = years[index].toString();
                    return GestureDetector(
                        onTap: () {
                          provide.setYear(years[index]);
                          Navigator.pop(context);
                        },
                        child: Container(
                          color:
                              selected ? AppColors.lightSky : AppColors.white,
                          child: Text(
                            data,
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge
                                ?.copyWith(height: .25.h),
                          ),
                        ));
                  })
              : ListView.builder(
                  itemCount: Constants.monthAbbreviations.keys.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = Helpers.getMonthDetailsByIndex(index);
                    final selected = data.key == provide.month;
                    final month = data.value;
                    return GestureDetector(
                      onTap: () {
                        provide.setMonth(data.key);
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: selected ? AppColors.lightSky : AppColors.white,
                        child: Text(
                          month.toString(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(height: .25.h),
                        ),
                      ),
                    );
                  }),
        );
      },
    ),
  );
}
