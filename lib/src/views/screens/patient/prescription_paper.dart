// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/cache_utils.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/models/page_config/page_config_response.dart';
import 'package:Medikalam/src/providers/dashboard/dashboard_provider.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';
import 'package:Medikalam/src/views/mixins/pen_connection_mixin.dart';
import 'package:Medikalam/src/views/screens/prescription/new_prescription_page.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/connection_bottomsheet.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/wrapper/shimmer_handler.dart';
import '../../widgets/buttons/custom_button.dart';

class PrescriptionPaper extends StatefulWidget {
  const PrescriptionPaper({super.key});

  @override
  State<PrescriptionPaper> createState() => _PrescriptionPaperState();
}

class _PrescriptionPaperState extends State<PrescriptionPaper>
    with PenConnectionMixin<PrescriptionPaper> {
  late PrescriptionProvider prescriptionProvider;

  @override
  void initState() {
    super.initState();
    // logger.i("PRESCRIPTION_PAPER_INIT: Widget initialized");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // logger.i("PRESCRIPTION_PAPER_POST_FRAME: Post frame callback executed");
      prescriptionProvider = context.read<PrescriptionProvider>();
      prescriptionProvider.pageDetails = PageDetails.fromJson(
          jsonDecode(await CacheUtils.getCached(Keys.pageConfig) ?? '{}'));
      prescriptionProvider.setTimelyUploads();
      // logger.i("PRESCRIPTION_PAPER_POST_FRAME: Provider setup completed");

      // Log current navigation state
      final currentRoute = GoRouterState.of(context).uri.path;
      // logger.i(
      //     "PRESCRIPTION_PAPER_NAV_STATE: Current route after init: $currentRoute");
    });
  }

  /// Custom app bar with intelligent back button navigation
  PreferredSizeWidget _buildCustomAppBar(BuildContext context,
      {List<Widget>? action}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7F7F7), Color(0xFFF9F9F9)],
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 2)),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              // logger.i("BACK_BUTTON_TAP: Custom app bar back button tapped");
              _handleBackNavigation(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w),
              child: SvgPicture.asset("assets/icons/back_btn.svg"),
            ),
          ),
          title: const Text('Prescription'),
          actions: action,
        ),
      ),
    );
  }

  /// Handle back navigation - simplified for single press
  void _handleBackNavigation(BuildContext context) {
    // logger.i("BACK_NAV_START: Back button pressed on PrescriptionPaper");

    // Get current route information
    final currentLocation = GoRouterState.of(context).uri.path;
    final canPop = context.canPop();

    // logger.i("BACK_NAV_INFO: Current route: $currentLocation");
    // logger.i("BACK_NAV_INFO: Can pop: $canPop");

    // Check navigation stack depth
    final router = GoRouter.of(context);
    // logger.i(
    //     "BACK_NAV_INFO: Router state: ${router.routerDelegate.currentConfiguration}");

    try {
      if (canPop) {
        // logger.i("BACK_NAV_ACTION: Attempting to pop current route");
        context.pop();
        // logger.i("BACK_NAV_SUCCESS: Successfully popped route");
      } else {
        // logger.i("BACK_NAV_ACTION: Cannot pop, navigating to dashboard");
        context.go(AppScreens.dashboard.path);
        // logger.i("BACK_NAV_SUCCESS: Successfully navigated to dashboard");
      }
    } catch (e, stackTrace) {
      // logger.e("BACK_NAV_ERROR: Navigation failed: $e");
      // logger.e("BACK_NAV_ERROR: Stack trace: $stackTrace");

      // Fallback navigation
      try {
        // logger.i("BACK_NAV_FALLBACK: Attempting fallback navigation");
        context.go(AppScreens.dashboard.path);
        // logger.i("BACK_NAV_FALLBACK: Fallback navigation successful");
      } catch (fallbackError) {
        // logger.e(
        //     "BACK_NAV_FALLBACK_ERROR: Fallback navigation also failed: $fallbackError");
      }
    }
  }

  @override
  void dispose() {
    logger.i("PRESCRIPTION_PAPER_DISPOSE: Widget being disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.d("PRESCRIPTION_PAPER_BUILD: Widget build method called");
    return Scaffold(
      appBar: _buildCustomAppBar(context, action: [
        Consumer<PenProvider>(builder: (context, provider, child) {
          return ShimmerHandler(
            status: Provider.of<DashboardProvider>(context).status,
            shimmer: headerShimmer(),
            onSuccess: appointHeader(
              theme: context.textTheme,
              title: '',
              title1: "",
              icon: provider.connectedPen != null
                  ? 'assets/icons/c1.svg'
                  : 'assets/icons/c2.svg',
              ontap: () {
                final clear = provider.connectedPen == null;
                startListener();
                startBle(clear: clear);
                penConnectionBottomSheet(context: context);
              },
            ),
          );
        }),
      ]),
      body: Consumer<PrescriptionProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            child: Column(
              children: [
                const NewPrescriptionPage(),

                if (provider.patientResponse != null)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.lightSky.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.lightSky,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.lightSky.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            color: AppColors.btnPrimary,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Linked Patient',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: AppColors.txtLabel,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                provider.patientResponse!.fullName,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Mobile: ${provider.patientResponse!.mobileNumber}',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.txtSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Option to change patient
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Change Patient?'),
                                content: const Text(
                                    'Do you want to link a different patient to this prescription?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // Navigate to patient selection
                                      logger.i(
                                          "NAV_PATIENT_SELECTION: Navigating to patient landing for selection");
                                      context.pushNamed(
                                        AppScreens.patientLanding.name,
                                        extra: {
                                          'operationMode':
                                              OperationMode.selection,
                                          'showBottomSheet': true,
                                        },
                                      );
                                    },
                                    child: const Text('Change Patient'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: AppColors.txtLabel,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.offWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.txtLabel.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.txtLabel,
                          size: 24,
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Text(
                            'No patient linked to this prescription',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.txtSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Case Details Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Consumer<PatientProvider>(
                      builder: (context, provider, child) {
                    return Column(
                      children: [
                        profileInfoWidget(
                          title: 'Case title',
                          info: provider.caseDetails.data!.title.isEmpty
                              ? 'Not specified'
                              : provider.caseDetails.data!.title,
                          theme: context.textTheme,
                        ),
                        SizedBox(height: 2.h),
                        profileInfoWidget(
                          title: 'Last update',
                          info: provider.caseDetails.data!.updatedAt.isEmpty
                              ? '-'
                              : provider.caseDetails.data!.updatedAt,
                          theme: context.textTheme,
                        ),
                        SizedBox(height: 2.h),
                        profileInfoWidget(
                          title: 'Prescription Page',
                          info: 'Page ${prescriptionProvider.pageNumber}',
                          theme: context.textTheme,
                        ),
                      ],
                    );
                  }),
                ),

                SizedBox(height: 3.h),

                // Link Patient Button
                CustomButtonNew(
                  text: provider.patientResponse != null
                      ? 'Change Linked Patient'
                      : 'Link with Patient',
                  color: provider.patientResponse != null
                      ? AppColors.txtSecondary
                      : AppColors.btnPrimary,
                  onTap: () async {
                    // logger.i(
                    //     "NAV_LINK_PATIENT: Navigating to patient landing to link patient");
                    context.pushNamed(
                      AppScreens.patientLanding.name,
                      extra: {
                        'operationMode': OperationMode.selection,
                        'showBottomSheet': true,
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
