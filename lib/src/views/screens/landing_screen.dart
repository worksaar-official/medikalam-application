// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              right: 0,
              child: SvgPicture.asset("assets/shapes/biggest_ellipse.svg")),
          Positioned(
              left: 14.w,
              bottom: 45.h,
              child: SvgPicture.asset(
                "assets/shapes/medium_ellipse.svg",
              )),
          Positioned(
              left: 45.w,
              bottom: 36.h,
              child: SvgPicture.asset(
                "assets/shapes/smallest_ellipse.svg",
              )),
          Positioned(
              right: 14.w,
              bottom: 36.h,
              child: SvgPicture.asset(
                "assets/shapes/medium_ellipse.svg",
              )),
          Positioned(
              right: 35.w,
              bottom: 2.h,
              child: SvgPicture.asset(
                "assets/shapes/medium_ellipse.svg",
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 40.h,
              child: SvgPicture.asset(
                "assets/shapes/down_arrow.svg",
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10.h),
                EasyRichText(
                  'Welcome to Medikalam',
                  patternList: [
                    EasyRichTextPattern(
                      targetString: 'Welcome ',
                      style: context.textTheme.displayLarge?.copyWith(
                        color: AppColors.blackColor,
                        wordSpacing: 4,
                      ),
                    ),
                    EasyRichTextPattern(
                      targetString: 'to',
                      style: context.textTheme.displayLarge?.copyWith(
                        color: AppColors.blackColor,
                        wordSpacing: 4.sp,
                      ),
                    ),
                    EasyRichTextPattern(
                      targetString: 'Medikalam',
                      style: context.textTheme.displayLarge?.copyWith(
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ],
                ),
                Gap(2.5.h),
                SizedBox(
                  width: 85.w,
                  child: Text(
                    'Immerse in the Najdi hospitality with Liwanee. Share your property and culture. Join our community',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: AppColors.txtLabel),
                  ),
                ),
                const Spacer(),
                CustomButtonNew(
                  text: 'Get Started',
                  onTap: () {
                    context.pushNamed(AppScreens.login.name);
                  },
                ),
                Gap(5.h)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
