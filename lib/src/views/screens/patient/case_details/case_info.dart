// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/custom_container/care_guide_widgets.dart';
import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/wrapper/status_handler.dart';

class CaseInfo extends StatefulWidget {
  const CaseInfo({super.key});
  @override
  State<CaseInfo> createState() => _CaseInfoState();
}

class _CaseInfoState extends State<CaseInfo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PatientProvider>(builder: (context, provider, child) {
      return StatusHandler(
        status: provider.caseStatus,
        onSuccess: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(
                  name: provider.caseDetails.data!.patient.name ?? 'N/A',
                  gender: provider.caseDetails.data!.patient.gender ?? 'N/A',
                  age: "23 Years"),
              _profileInfo(
                  title: provider.caseDetails.data!.title,
                  lastUpdate: provider.caseDetails.data!.updatedAt.date,
                  time: provider.caseDetails.data!.updatedAt.time),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  'Guides',
                  style: context.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // TODO: CASE GUIDES
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: careGuideWidget(
                      title: 'Care Guide Title',
                      desc: 'A brief description of the care guide',
                      theme: context.textTheme,
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    custombottomSheet(
                      context: context,
                      child: SizedBox(
                        height: 60.h,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Guides',
                                style: context.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              // TODO: SHOULD DISPLY GUIDES FROM PROFILE CARE GUIDES TO SELECT
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3),
                                    // ignore: lines_longer_than_80_chars
                                    child: careGuideWidget(
                                      title: 'care Guide',
                                      desc: 'care Guides',
                                      theme: context.textTheme,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              const CustomButtonNew(
                                text: 'add',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.btnPrimary,
                      ),
                      Text(
                        'New Guide',
                        style: context.textTheme.labelMedium!.copyWith(
                          color: AppColors.txtPrimary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  'Attachments',
                  style: context.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              addDocumentWidget(
                img: 'assets/icons/presc.svg',
                title: 'Normal Presciption',
                desc: 'You can add image of old non Medikalam prescription',
                theme: context.textTheme,
              ),
              Align(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.btnPrimary,
                      ),
                      Text(
                        'New Attachment',
                        style: context.textTheme.labelMedium!.copyWith(
                          color: AppColors.txtPrimary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _title(
      {required String name, required String gender, required String age}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: context.textTheme.bodyLarge),
              Text("$gender | $age",
                  style:
                      context.textTheme.labelMedium?.copyWith(fontSize: 15.sp)),
            ],
          ),
          const Spacer(),
          SvgPicture.asset("assets/icons/call.svg", height: 5.h)
        ],
      ),
    );
  }

  Widget _profileInfo(
      {required String title,
      required String lastUpdate,
      required String time}) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _row('Case title', title),
          _row('Last update', lastUpdate),
          _row('Time', time),
        ],
      ),
    );
  }

  Widget _row(String title, String info) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 15.sp)
                  .copyWith(color: AppColors.txtLabel),
            ),
          ),
          Expanded(
            child: Text(
              info,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w700)
                  .copyWith(color: AppColors.documentColor),
            ),
          ),
        ],
      ),
    );
  }
}
