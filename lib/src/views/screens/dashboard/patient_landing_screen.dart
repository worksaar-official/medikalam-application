// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/providers/appointment/appointment_provider.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';
import 'package:Medikalam/src/views/mixins/paginated_searchable_mixin.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/add_patient_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/search_field.dart';
import 'package:Medikalam/src/views/widgets/wrapper/status_handler.dart';

class PatientLandingPage extends StatefulWidget {
  final OperationMode operationMode;
  final bool showBottomSheet;
  const PatientLandingPage(
      {super.key,
      this.showBottomSheet = false,
      this.operationMode = OperationMode.render});

  @override
  State<PatientLandingPage> createState() => _PatientLandingPageState();
}

class _PatientLandingPageState extends State<PatientLandingPage>
    with PaginatedSearchableMixin<PatientLandingPage, PatientProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.operationMode != OperationMode.render
          ? backAppbar(
              context,
              widget.operationMode == OperationMode.selection
                  ? "Select Patient"
                  : "Patients",
              height: 15.h,
              tabs: Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 1.h),
                  child: SearchField(
                    controller: searchController,
                    text: "Search Patients",
                    color: AppColors.white,
                  ),
                ),
              ),
            )
          : AppBar(
              actions: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SearchField(
                      controller: searchController,
                      text: "Patients",
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
      body: Consumer<PatientProvider>(builder: (context, provider, child) {
        return StatusHandler(
          status: provider.fetchStatus,
          onSuccess: SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: List.generate(provider.entities.length, (index) {
                final entity = provider.entities[index];
                return PatientCard(
                  onLink: widget.operationMode == OperationMode.render
                      ? () async {
                          await context
                              .read<PrescriptionProvider>()
                              .addMobileNumber(
                                  entity.mobileNumber.toString(), entity.id);
                          context.pushReplacement(
                              AppScreens.prescriptionPaper.path);
                          logger.d("Mobile Number : ${entity.mobileNumber}");
                        }
                      : null,
                  onTap: () async {
                    switch (widget.operationMode) {
                      case OperationMode.render:
                        context.pushNamed(AppScreens.patientDetail.name,
                            extra: provider.entities[index]);
                        break;

                      case OperationMode.selection:
                        EasyLoading.show();
                        await context.read<PrescriptionProvider>().linkPage(
                            mobileNumber: entity.mobileNumber.toString());
                        if (context.mounted) {
                          context.pop();
                          logger.d("Patient linked: ${entity.fullName}");
                        }
                        EasyLoading.dismiss();
                        break;

                      case OperationMode.filtration:
                        context
                            .read<AppointmentProvider>()
                            .form
                            .control('patient_id')
                            .value = entity.id;
                        context.push(AppScreens.bookAppointment.path);
                        break;
                    }
                  },
                  title: entity.fullName,
                  desc: entity.mobileNumber.toString(),
                  theme: context.textTheme,
                );
              }),
            ),
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            onPressed: () async {
              if (widget.showBottomSheet) {
                await newPatientBottomSheet(context);
              } else {
                context.push(AppScreens.addPatient.path);
              }
            },
            backgroundColor: AppColors.lightSky,
            label: Row(
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.btnPrimary,
                ),
                Text(
                  ' New Patient',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.txtPrimary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
