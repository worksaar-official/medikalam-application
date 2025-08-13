// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

class HelperContainer extends StatelessWidget {
  const HelperContainer({
    required this.title,
    required this.widget,
    this.padding,
    this.style,
    super.key,
  });
  final String title;
  final Widget widget;
  final TextStyle? style;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title == '')
            const SizedBox()
          else
            Text(
              title,
              style: style ??
                  context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.txtLabel,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          SizedBox(
            height: 1.h,
          ),
          widget,
        ],
      ),
    );
  }
}

class LabelContainer extends StatelessWidget {
  const LabelContainer({
    required this.title,
    required this.widget,
    this.padding,
    this.style,
    super.key,
  });
  final String title;
  final Widget widget;
  final TextStyle? style;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title == '')
          const SizedBox()
        else
          Text(title,
              style: style ??
                  context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: AppColors.txtLabel)),
        SizedBox(width: 1.w),
        Padding(padding: EdgeInsets.symmetric(vertical: 1.h), child: widget),
      ],
    );
  }
}
