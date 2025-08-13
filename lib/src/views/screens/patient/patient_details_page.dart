// Flutter imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/models/patient/patient.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/confirmation_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/custom_container/case_card.dart';
import 'package:Medikalam/src/views/widgets/custom_container/patient_title_container.dart';
import 'package:Medikalam/src/views/widgets/custom_container/personal_info_card.dart';
import 'package:Medikalam/src/views/widgets/labels/subtitle.dart';
import 'package:Medikalam/src/views/widgets/wrapper/data_handler.dart';
import 'package:Medikalam/src/views/widgets/wrapper/status_handler.dart';

class PatientDetailsPage extends StatefulWidget {
  final PatientResponse pData;
  const PatientDetailsPage({required this.pData, super.key});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PatientProvider>().viewPatient(widget.pData.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppbar(context, 'Patient Details', action: [
        IconButton(
          style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.chat_bubble_2_fill,
            color: AppColors.documentColor,
          ),
        )
      ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PatientTitle(
              title: widget.pData.fullName,
              title1: 'Last Visit - ${DateTime.fromMillisecondsSinceEpoch(widget.pData.updatedAt).date}',
              onTap: () {
                Helpers.makeCall(widget.pData.mobileNumber.toString());
              },
            ),
            Gap(2.5.h),
            PersonalInfoCard(
                registrationId: widget.pData.id,
                age: widget.pData.age.toString(),
                gender: widget.pData.gender,
                mobileNumber: widget.pData.mobileNumber.toString()),
            Divider(height: 2.h),
            const Subtitle(title: "Cases"),
            Gap(2.5.h),
            Consumer<PatientProvider>(builder: (context, provider, child) {
              return StatusHandler(
                status: provider.detailsStatus,
                onSuccess: DataHandler(
                  data: provider.cases,
                  child: ListView.builder(
                      itemCount: provider.cases.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final patientCase = provider.cases[index];
                        return CaseCard(
                            title: patientCase.creatorId,
                            pages: patientCase.pageCount,
                            isOpen: patientCase.isOpen,
                            onTap: () {
                              context.pushNamed(AppScreens.caseDetail.name,
                                  extra: patientCase.id);
                            });
                      }),
                ),
              );
            }),
            Gap(5.h),
            CustomButtonNew(
              text: 'Edit Details',
              color: AppColors.contPrimary,
              style: context.textTheme.titleMedium?.copyWith(fontSize: 16.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButtonNew(
              text: 'Delete Patient',
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.redText,
                fontSize: 16.sp,
              ),
              onTap: () {
                confirmSheet(
                    title: "Delete Patient",
                    context: context,
                    onDelete: () async {
                      await context.read<PatientProvider>().deletePatient(
                            widget.pData.id,
                          );
                    });
              },
              color: AppColors.redBtn,
            ),
          ],
        ),
      ),
    );
  }
}
