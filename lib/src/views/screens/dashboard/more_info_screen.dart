// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/services/routing/utils/router_function.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/connection_bottomsheet.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 3.w),
              child: appointHeader(
                title: 'Good Morning',
                title1: 'Dr. Ashray Mangal',
                icon: 'assets/icons/c2.svg',
                theme: context.textTheme,
                ontap: () {
                  penConnectionBottomSheet(context: context);
                },
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: AppColors.iconPrimary,
                size: 25,
              ),
              onTap: () => context.push(AppScreens.profile.path),
              title: Text(
                'Profile',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 17,
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/faq.svg',
                height: 23,
                width: 23,
              ),
              title: Text(
                'FAQs',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/feedback.svg',
                height: 23,
                width: 23,
              ),
              title: Text(
                'Feedback',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                context.push(AppScreens.careGuides.path);
              },
              leading: SvgPicture.asset(
                'assets/icons/care.svg',
                height: 23,
                width: 23,
              ),
              title: Text(
                'care guides',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 17,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButtonNew(
                  width: 80.w,
                  color: const Color.fromARGB(255, 248, 222, 225),
                  text: 'Log out',
                  onTap: () {
                    custombottomSheet(
                      context: context,
                      child: SizedBox(
                        height: 28.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                'Log out',
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Are you sure  do you want to log out ?',
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.txtLabel,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButtonNew(
                                    width: 40.w,
                                    text: 'Yes',
                                    onTap: () async {
                                      await Helpers.clearShared();
                                      removeAllAndPush(
                                          context, AppScreens.landing.path);
                                    },
                                    color:
                                        const Color.fromRGBO(248, 222, 225, 1),
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      color: const Color.fromARGB(
                                        255,
                                        179,
                                        40,
                                        56,
                                      ),
                                      fontSize: 13,
                                    ),
                                  ),
                                  CustomButtonNew(
                                    width: 40.w,
                                    text: 'No',
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      color: AppColors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: const Color.fromARGB(255, 179, 40, 56),
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
