// Flutter imports:

// Flutter imports:
import 'package:Medikalam/src/models/pen/connected_pen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/bar.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';

Future<void> penConnectionBottomSheet({
  required BuildContext context,
}) {
  return custombottomSheet(
      context: context,
      scroll: false,
      onClose: () {
        context.read<PenProvider>().setShowSvg(false);
      },
      child: Consumer<PenProvider>(builder: (context, provider, child) {
        return IntrinsicHeight(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Left to right transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            child: provider.showSvg
                ? _showSvg(provider.connectedPen.toString(), context.textTheme)
                : Column(children: [
                    bar(),
                    ...List.generate(provider.penList.length, (index) {
                      final pen = provider.penList[index];
                      final title = pen.macAddress;
                      final connectedDevice = provider.connectedPen;
                      final currentDevice = connectedDevice != null &&
                          connectedDevice.macAddress == title;

                      return _penBuilder(
                        context,
                        title: title,
                        connectedDevice: connectedDevice,
                        onTap: () {
                          if (currentDevice) {
                            provider.disconnectPen();
                            provider
                                .deletePen(provider.connectedPen.toString());
                          } else {
                            provider.connect(pen.macAddress);
                            provider.setShowSvg(true);
                          }
                        },
                      );
                    }),
                    Gap(5.h)
                  ]),
          ),
        );
      }));
}

Widget _showSvg(String title, TextTheme textStyle) {
  return Column(
    children: [
      bar(),
      Image.asset("assets/images/pen.png", height: 30.h),
      Text(title,
          style: textStyle.displaySmall
              ?.copyWith(color: AppColors.documentColor, fontSize: 18.sp)),
      Text(
        "is connected",
        style: textStyle.displaySmall
            ?.copyWith(color: AppColors.subTitle, fontSize: 18.sp),
      )
    ],
  );
}

Widget _penBuilder(BuildContext context,
    {required String title,
    required ConnectedPen? connectedDevice,
    void Function()? onTap}) {
  return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.txtLabel,
                  blurRadius: 3,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: SvgPicture.asset(
              ((connectedDevice != null && connectedDevice.macAddress == title))
                  ? 'assets/icons/c1.svg'
                  : 'assets/icons/c2.svg',
              height: 40,
              width: 40,
            ),
          ),
          Gap(4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style:
                      context.textTheme.bodyMedium?.copyWith(fontSize: 15.sp)),
              Text(
                ((connectedDevice != null &&
                        connectedDevice.macAddress == title))
                    ? 'Connected'
                    : "Disconnected",
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.subTitle, fontSize: 15.sp),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              ((connectedDevice != null && connectedDevice.macAddress == title))
                  ? "Disconnect"
                  : "Connect",
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.txtLabel,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp),
            ),
          ),
        ],
      ));
}
