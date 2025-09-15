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
import 'package:Medikalam/src/providers/dashboard/dashboard_provider.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/providers/permission/permission_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';
import 'package:Medikalam/src/views/mixins/pen_connection_mixin.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/connection_bottomsheet.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/wrapper/shimmer_handler.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';

import '../../../core/utils/helpers/notification_helper.dart'
    as NotificationHelper;

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

      // Listen for pen events
      penProvider.penEventStream.listen((event) {
        if (event != null) {
          logger.i('DASHBOARD: Pen event received: $event');

          // If it's a restart_scanning event or regular pen connection
          if (event == "restart_scanning") {
            logger.i('DASHBOARD: Restarting BLE scanning after disconnect');
            startListener();
            startBle(
                clear: true); // Clear previous pen list and restart scanning
          } else {
            // Regular pen connection event
            startListener();
            startBle();
          }
        } else {
          penProvider.penDisconnected();
        }
      });

      // Check for previously connected pen and setup auto-reconnection
      if (penProvider.shouldAutoReconnect) {
        final mac = penProvider.savedPenMacAddress!;
        logger.i(
            'DASHBOARD: Found previously connected pen MAC: $mac, setting up auto-reconnection');

        // Start listeners and BLE scanning for auto-reconnection
        startListener();
        startBle(clear: true);

        // Log that we're ready for auto-reconnection
        logger.i(
            'DASHBOARD: Auto-reconnection ready. Pen will connect when cap is opened.');
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
                              if (provider.connectedPen?.macAddress != null) {
                                context.push(AppScreens.prescriptionPaper.path);
                              } else {
                                NotificationHelper.showError(
                                    "Pen connection not established");
                              }
                            } else {
                              await penConnectionBottomSheet(context: context);
                              // Verify connection after bottom sheet closes
                              if (!provider.isConnected) {
                                NotificationHelper.showError(
                                    "Please connect a pen first");
                              }
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
