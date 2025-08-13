// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';

PopupMenuItem headerBtn(BuildContext context) {
  return PopupMenuItem(
    padding: EdgeInsets.zero,
    child: GestureDetector(
      onTap: context.read<AppointmentProvider>().toggleShowYear,
      child: Consumer<AppointmentProvider>(
        builder: (context, provide, state) {
          return Container(
            width: 100.w,
            color: AppColors.backgroundPrimary,
            child: provide.showYear
                ? Text(
                    provide.year.toString(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontSize: 18.sp, color: AppColors.white),
                  )
                : Text(
                    Helpers.getMonthAbbreviation(provide.month),
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontSize: 18.sp, color: AppColors.white),
                  ),
          );
        },
      ),
    ),
  );
}
