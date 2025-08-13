// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

class CaseCard extends StatelessWidget {
  final String title;
  final int pages;
  final bool isOpen;
  final Function() onTap;
  const CaseCard(
      {super.key,
      required this.title,
      required this.pages,
      required this.isOpen,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/case.svg"),
                Gap(4.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: AppColors.textPrimary)),
                    Text("Pages - $pages | ${isOpen.caseStatus}",
                        style: context.textTheme.labelMedium
                            ?.copyWith(fontSize: 15.sp))
                  ],
                )
              ],
            ),
          ),
          Divider(height: 2.5.h)
        ],
      ),
    );
  }
}
