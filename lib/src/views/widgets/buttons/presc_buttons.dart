// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';

class PrescButtons extends StatelessWidget {
  const PrescButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 3.h,
          ),

          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              children: <Widget>[
                numberButtons(
                  text: '1',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                numberButtons(
                  text: '2',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                numberButtons(
                  text: '3',
                  ontap: () {},
                  theme: context.textTheme,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              numberButtons(
                text: '4',
                ontap: () {},
                theme: context.textTheme,
              ),
              numberButtons(
                text: '5',
                ontap: () {},
                theme: context.textTheme,
              ),
              numberButtons(
                text: '6',
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              numberButtons(
                text: '7',
                ontap: () {},
                theme: context.textTheme,
              ),
              numberButtons(
                text: '8',
                ontap: () {},
                theme: context.textTheme,
              ),
              numberButtons(
                text: '9',
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              numberButtons(
                text: '0',
                ontap: () {},
                theme: context.textTheme,
              ),
              numberButtons(
                text: 'Del',
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: const Text('Record Voice'),
          ),
          Row(
            children: <Widget>[
              iconButtons(
                icon: Icons.mic,
                ontap: () {},
                theme: context.textTheme,
              ),
              iconButtons(
                icon: Icons.mic_off,
                ontap: () {},
                theme: context.textTheme,
              ),
              iconButtons(
                icon: Icons.share,
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: const Text('Share Care Guides'),
          ),

          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textButtons(
                text: 'Guide 1',
                ontap: () {},
                theme: context.textTheme,
              ),
              iconButtons(
                  icon: Icons.share, ontap: () {}, theme: context.textTheme),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textButtons(
                text: 'Guide 2',
                ontap: () {},
                theme: context.textTheme,
              ),
              iconButtons(
                  icon: Icons.share, ontap: () {}, theme: context.textTheme),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textButtons(
                text: 'Others',
                ontap: () {},
                theme: context.textTheme,
              ),
              iconButtons(
                  icon: Icons.share, ontap: () {}, theme: context.textTheme),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),

          // Refer To
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const Text('Refer To'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textButtons(
                text: 'Lab 1',
                ontap: () {},
                theme: context.textTheme,
              ),
              textButtons(
                text: 'Lab 2',
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textButtons(
                text: 'Pharmacy',
                ontap: () {},
                theme: context.textTheme,
              ),
              textButtons(
                text: 'other',
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: const Text('Attachments'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              iconButtons(
                icon: Icons.camera_alt_rounded,
                ontap: () {},
                theme: context.textTheme,
              ),
              iconButtons(
                icon: Icons.image_search_outlined,
                ontap: () {},
                theme: context.textTheme,
              ),
              iconButtons(
                icon: Icons.picture_as_pdf,
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          const Text('Visit After'),
          Row(
            children: <Widget>[
              textButtons(
                  ontap: () {}, text: 'Close Case', theme: context.textTheme),
            ],
          ),

          textButtons(
            ontap: () {},
            text: 'Submit Prescription',
            theme: context.textTheme,
          ),
        ],
      ),
    );
  }
}

class MobilePhoneButtons extends StatelessWidget {
  const MobilePhoneButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mobile No.'),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              children: <Widget>[
                mobileButtons(
                  text: '1',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                mobileButtons(
                  text: '2',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                mobileButtons(
                  text: '3',
                  ontap: () {},
                  theme: context.textTheme,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              children: <Widget>[
                mobileButtons(
                  text: '4',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                mobileButtons(
                  text: '5',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                mobileButtons(
                  text: '6',
                  ontap: () {},
                  theme: context.textTheme,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Row(
              children: <Widget>[
                mobileButtons(
                  text: '7',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                mobileButtons(
                  text: '8',
                  ontap: () {},
                  theme: context.textTheme,
                ),
                mobileButtons(
                  text: '9',
                  ontap: () {},
                  theme: context.textTheme,
                ),
              ],
            ),
          ),

          Row(
            children: <Widget>[
              mobileButtons(
                text: '0',
                ontap: () {},
                theme: context.textTheme,
              ),
              mobileButtons(
                text: 'Del',
                ontap: () {},
                theme: context.textTheme,
              ),
            ],
          ),

          Row(
            children: [
              mobileButtons(
                ontap: () {},
                text: '',
                theme: context.textTheme,
              ),
              textButtons(
                ontap: () {},
                text: 'Close Case',
                theme: context.textTheme,
                color: AppColors.contPrimary,
              ),
            ],
          ),

          // Submit Prescription
          Padding(
            padding: const EdgeInsets.all(3),
            child: CustomButtonNew(
              borderRadius: 0,
              text: 'Submit Prescription',
              color: AppColors.contPrimary,
              width: 28.w,
              height: 3.h,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: AppColors.blackColor, fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
