// Flutter imports:

// Flutter imports:

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/constant.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/providers/dashboard/dashboard_provider.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/providers/permission/permission_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';
import 'package:Medikalam/src/views/mixins/pen_connection_mixin.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/connection_bottomsheet.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/wrapper/shimmer_handler.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with PenConnectionMixin<DashboardScreen> {
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
      context.read<PermissionListenerProvider>();
      context.read<PrescriptionProvider>().getPageConfig();
      context.read<PrescriptionProvider>().addSymbols();
      final penProvider = context.read<PenProvider>();

      // Try to connect to the pen if it is already connected
      penProvider.penEventStream.listen((event) {
        if (event != null) {
          startListener();
          startBle();
        } else {
          penProvider.penDisconnected();
        }
      });
      // final mac = Helpers.getString(key: Keys.connectedPenMac);

      // if (mac != null) {
      //   final clear = penProvider.connectedPen == null;
      //   startListener();
      //   startBle(clear: clear);
      //   penConnectionBottomSheet(context: context);
      // }

      final mac = Helpers.getString(key: Keys.connectedPenMac);
      if (mac != null) {
        final clear = penProvider.connectedPen == null;
        startListener();

        connect(mac).then((_) {
          startBle(clear: clear);

          // Wait and check if pen list gets populated
          Future.delayed(const Duration(seconds: 1), () {
            final penList = context.read<PenProvider>().penList;
            if (penList.isNotEmpty) {
              penConnectionBottomSheet(context: context);
            } else {
              // Retry once after a short delay if still empty
              Future.delayed(const Duration(seconds: 1), () {
                final secondTryList = context.read<PenProvider>().penList;
                if (secondTryList.isNotEmpty) {
                  penConnectionBottomSheet(context: context);
                } else {
                  debugPrint("No pens found to show in bottom sheet.");
                }
              });
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      return Scaffold(
          body: SafeArea(
            child: PageStorage(
                bucket: _bucket,
                child: Constants
                    .pages[context.read<DashboardProvider>().navIndex]),
          ),
          floatingActionButton: provider.navIndex == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Consumer<PenProvider>(builder: (context, provider, child) {
                      return ShimmerHandler(
                        status: Provider.of<DashboardProvider>(context).status,
                        shimmer: headerShimmer(),
                        onSuccess: appointHeader(
                          theme: context.textTheme,
                          title: '',
                          title1: "",
                          icon: provider.isConnected
                              ? 'assets/icons/c1.svg'
                              : 'assets/icons/c2.svg',
                          ontap: () async {
                            final isConnected = provider.isConnected;
                            logger.d("Pen tapped — isConnected: $isConnected");
                            final clear = !isConnected;

                            startListener();
                            startBle(clear: clear);

                            if (isConnected) {
                              context.read<PrescriptionProvider>().isScan =
                                  false;
                              context.push(AppScreens.prescriptionPaper.path);
                            } else {
                              await penConnectionBottomSheet(context: context);
                            }
                          },
                        ),
                      );
                    }),
                    Gap(2.h),
                    FloatingActionButton(
                      mini: true,
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.white,
                      onPressed: () async {
                        context.push(AppScreens.qrScanner.path);
                      },
                      child: Icon(Icons.qr_code, color: AppColors.btnPrimary),
                    ),
                  ],
                )
              : null,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFEFEFEF),
                  blurRadius: 10, // The blur radius of the shadow
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 0,
              enableFeedback: true,
              selectedLabelStyle:
                  context.textTheme.titleSmall?.copyWith(inherit: true),
              selectedItemColor: AppColors.navText,
              unselectedItemColor: AppColors.white,
              // Hide the Appointment tab (index 1) by showing only indices [0, 2, 3]
              // Map visible indices -> actual page indices
              currentIndex: [0, 2, 3].indexOf(provider.navIndex).clamp(0, 2),
              onTap: (visibleIndex) {
                final mapped = [0, 2, 3][visibleIndex];
                provider.updateIndex(mapped);
              },
              items: [0, 2, 3]
                  .map(
                    (actualIndex) => BottomNavigationBarItem(
                      backgroundColor: AppColors.white,
                      icon: SvgPicture.asset(
                        Constants.icons[actualIndex],
                        colorFilter: ColorFilter.mode(
                          provider.navIndex == actualIndex
                              ? Colors.blue
                              : AppColors.txtLabel,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: Constants.iconText[actualIndex],
                    ),
                  )
                  .toList(),
            ),
          ));
    });
  }
}
