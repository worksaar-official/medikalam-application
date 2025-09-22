// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';

class DocumentCard extends StatelessWidget {
  final String title;
  final String type;
  final String? url;
  final VoidCallback? onTap;

  const DocumentCard({
    super.key,
    required this.title,
    required this.type,
    this.url,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 0.8.h),
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.2.h),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(1.5.w),
              decoration: BoxDecoration(
                color: AppColors.documentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: SvgPicture.asset(
                'assets/icons/document.svg',
                height: 3.h,
                color: AppColors.documentColor,
              ),
            ),
            Gap(2.5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Gap(0.3.h),
                  Text(
                    type.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.lightGrey,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
