// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

Future<void> imagebottomSheet({
  required BuildContext context,
  bool? scroll,
  Widget? child,
}) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    isScrollControlled: scroll ?? true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 25.h,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Text(
                      'Upload Image',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.documentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const UploadContainer(
                      img: 'assets/icons/camera.svg',
                      text: 'Take picture',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const UploadContainer(
                      img: 'assets/icons/gallery.svg',
                      text: 'Upload from gallery',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Future<void> careguidebottomSheet({
  required BuildContext context,
  required VoidCallback ontap,
  required VoidCallback ontap1,
  bool? scroll,
  Widget? child,
}) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    isScrollControlled: scroll ?? true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 25.h,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Text(
                      'Add care guide',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.documentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: ontap,
                    child: const UploadContainer(
                      img: 'assets/icons/audio.svg',
                      text: 'Add audio guide',
                    ),
                  ),
                  InkWell(
                    onTap: ontap1,
                    child: const UploadContainer(
                      img: 'assets/icons/video.svg',
                      text: 'Add video guide',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class UploadContainer extends StatelessWidget {
  const UploadContainer({required this.img, required this.text, super.key});
  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.offWhite,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              img,
              colorFilter:
                  ColorFilter.mode(AppColors.documentColor, BlendMode.srcIn),
              height: 25,
              width: 25,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              text,
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.documentColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
