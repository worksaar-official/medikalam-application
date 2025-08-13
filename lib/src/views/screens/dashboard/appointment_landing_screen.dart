// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';
import 'package:Medikalam/src/views/mixins/paginated_searchable_mixin.dart';
import 'package:Medikalam/src/views/widgets/appbar/calendar_appbar.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/wrapper/data_handler.dart';
import 'package:Medikalam/src/views/widgets/wrapper/status_handler.dart';

class AppointmentLandingPage extends StatefulWidget {
  const AppointmentLandingPage({super.key});

  @override
  State<AppointmentLandingPage> createState() => _AppointmentLandingPageState();
}

class _AppointmentLandingPageState extends State<AppointmentLandingPage>
    with PaginatedSearchableMixin<AppointmentLandingPage, AppointmentProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: calendarAppBar(context),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Consumer<AppointmentProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.titleDate,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                StatusHandler(
                  status: provider.fetchStatus,
                  onSuccess: DataHandler(
                    data: provider.entities,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider.entities.length,
                      itemBuilder: (context, index) {
                        final entity = provider.entities[index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: PatientCard(
                                  title: entity.name,
                                  desc: entity.patientId,
                                  theme: context.textTheme,
                                  divider: false),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                      thickness: 0.5,
                                      height: 4.h,
                                      color: AppColors.txtPrimary,
                                      endIndent: 4.w),
                                ),
                                Text(entity.apptTime),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        splashColor: AppColors.lightSky,
        icon: Icon(Icons.add, color: AppColors.btnPrimary),
        shape: const StadiumBorder(),
        onPressed: () {
          context.push(AppScreens.patientLanding.path,
              extra: OperationMode.selection);
        },
        backgroundColor: AppColors.lightSky,
        label: Text(
          'New Appointment',
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.txtPrimary,
            fontSize: 13,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
