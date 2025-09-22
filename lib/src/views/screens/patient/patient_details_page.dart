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
import 'package:Medikalam/src/views/screens/documents/document_viewer_screen.dart';
import 'package:Medikalam/src/views/widgets/wrapper/data_handler.dart';
import 'package:Medikalam/src/views/widgets/wrapper/status_handler.dart';

class PatientDetailsPage extends StatefulWidget {
  final PatientResponse pData;
  const PatientDetailsPage({required this.pData, super.key});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  bool isCasesExpanded = true;
  bool isDocumentsExpanded = true;

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
              title1:
                  'Last Visit - ${DateTime.fromMillisecondsSinceEpoch(widget.pData.updatedAt).date}',
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
            // Cases Section Header
            Consumer<PatientProvider>(builder: (context, provider, child) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isCasesExpanded = !isCasesExpanded;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Row(
                    children: [
                      Text(
                        "Cases",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                ),
                      ),
                      Gap(2.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          color: provider.cases.isNotEmpty
                              ? Colors.green.withOpacity(0.1)
                              : AppColors.lightGrey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${provider.cases.length}",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: provider.cases.isNotEmpty
                                        ? Colors.green[700]
                                        : AppColors.lightGrey,
                                  ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isCasesExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.lightGrey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
            // Cases List
            if (isCasesExpanded) ...[
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
            ],
            Gap(2.5.h),
            // Documents Section Header
            Consumer<PatientProvider>(builder: (context, provider, child) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isDocumentsExpanded = !isDocumentsExpanded;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Row(
                    children: [
                      Text(
                        "Documents",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                ),
                      ),
                      Gap(2.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          color: provider.documents.isNotEmpty
                              ? Colors.green.withOpacity(0.1)
                              : AppColors.lightGrey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${provider.documents.length}",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: provider.documents.isNotEmpty
                                        ? Colors.green[700]
                                        : AppColors.lightGrey,
                                  ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        isDocumentsExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.lightGrey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
            // Documents List
            if (isDocumentsExpanded) ...[
              Gap(2.5.h),
              // Document Categories in Horizontal Layout
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Consumer<PatientProvider>(
                        builder: (context, provider, child) {
                      return _buildHorizontalDocumentCategory(
                        context,
                        "Normal Report",
                        Icons.description,
                        Colors.blue,
                        provider.normalReports.length,
                        () {
                          // Show list of normal reports or first one
                          if (provider.normalReports.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DocumentViewerScreen(
                                  documentTitle:
                                      provider.normalReports.first.title,
                                  documentType:
                                      provider.normalReports.first.type,
                                  documentUrl: provider.normalReports.first.url,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }),
                    Gap(2.w),
                    Consumer<PatientProvider>(
                        builder: (context, provider, child) {
                      return _buildHorizontalDocumentCategory(
                        context,
                        "Report",
                        Icons.assignment,
                        Colors.orange,
                        provider.reports.length,
                        () {
                          // Show list of reports or first one
                          if (provider.reports.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DocumentViewerScreen(
                                  documentTitle: provider.reports.first.title,
                                  documentType: provider.reports.first.type,
                                  documentUrl: provider.reports.first.url,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }),
                    Gap(2.w),
                    Consumer<PatientProvider>(
                        builder: (context, provider, child) {
                      return _buildHorizontalDocumentCategory(
                        context,
                        "Scan Documents",
                        Icons.scanner,
                        Colors.purple,
                        provider.scanDocuments.length,
                        () {
                          // Show list of scan documents or first one
                          if (provider.scanDocuments.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DocumentViewerScreen(
                                  documentTitle:
                                      provider.scanDocuments.first.title,
                                  documentType:
                                      provider.scanDocuments.first.type,
                                  documentUrl: provider.scanDocuments.first.url,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
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

  Widget _buildHorizontalDocumentCategory(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    int count,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25.w, // Fixed width for horizontal layout
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                icon,
                color: color,
                size: 16,
              ),
            ),
            Gap(1.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Gap(0.5.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.3.h),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "$count",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
