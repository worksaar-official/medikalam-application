// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';

class DocumentViewerScreen extends StatelessWidget {
  final String documentTitle;
  final String documentType;
  final String? documentUrl;

  const DocumentViewerScreen({
    super.key,
    required this.documentTitle,
    required this.documentType,
    this.documentUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppbar(context, documentTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Document Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: AppColors.documentColor,
                        size: 24,
                      ),
                      Gap(3.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              documentTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Gap(0.5.h),
                            Text(
                              documentType.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(3.h),

            // Document Content based on type
            _buildDocumentContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentContent(BuildContext context) {
    // Check if we have real data or should show "No Data"
    if (documentUrl == null || documentUrl!.isEmpty) {
      return _buildNoDataContent(context);
    }

    switch (documentTitle) {
      case "Normal Report":
        return _buildNormalReportContent(context);
      case "Report":
        return _buildReportContent(context);
      case "Scan Documents":
        return _buildScanDocumentsContent(context);
      default:
        return _buildDefaultContent(context);
    }
  }

  Widget _buildNormalReportContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Normal Report Details",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(2.h),
        _buildInfoCard(context, "Patient Name", "HHsh"),
        _buildInfoCard(context, "Report Date", "September 09, 2025"),
        _buildInfoCard(context, "Report Type", "General Health Checkup"),
        _buildInfoCard(context, "Doctor", "Dr. Smith"),
        _buildInfoCard(context, "Status", "Completed"),
        Gap(2.h),
        Text(
          "Report Summary",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(1.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Text(
            "Patient shows normal vital signs. Blood pressure within normal range. No immediate concerns identified. Follow-up recommended in 3 months.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.blackColor,
                  height: 1.5,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildReportContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Clinical Report",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(2.h),
        _buildInfoCard(context, "Patient ID", "68c026417be768e18b9c7ae1"),
        _buildInfoCard(context, "Report Date", "September 09, 2025"),
        _buildInfoCard(context, "Department", "Internal Medicine"),
        _buildInfoCard(context, "Physician", "Dr. Johnson"),
        _buildInfoCard(context, "Priority", "Routine"),
        Gap(2.h),
        Text(
          "Clinical Notes",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(1.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Text(
            "Patient presented with routine checkup. Vital signs stable. Laboratory results within normal parameters. No acute findings. Patient advised to maintain current lifestyle and return for follow-up as scheduled.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.blackColor,
                  height: 1.5,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildScanDocumentsContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Scanned Documents",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(2.h),
        _buildInfoCard(context, "Scan Date", "September 09, 2025"),
        _buildInfoCard(context, "Document Count", "3 files"),
        _buildInfoCard(context, "File Format", "PDF"),
        _buildInfoCard(context, "Status", "Processed"),
        Gap(2.h),
        Text(
          "Scanned Files",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(1.h),
        _buildFileItem(context, "Lab Results - Blood Test", "2.3 MB"),
        _buildFileItem(context, "X-Ray Report - Chest", "1.8 MB"),
        _buildFileItem(context, "Prescription - Medication", "0.9 MB"),
      ],
    );
  }

  Widget _buildNoDataContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Document Information",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(2.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            children: [
              Icon(
                Icons.description_outlined,
                size: 48,
                color: AppColors.lightGrey,
              ),
              Gap(2.h),
              Text(
                "No Data Available",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Gap(1.h),
              Text(
                "This document does not contain any data yet.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.lightGrey,
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Document Information",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gap(2.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            children: [
              Icon(
                Icons.description_outlined,
                size: 48,
                color: AppColors.lightGrey,
              ),
              Gap(2.h),
              Text(
                "No Data Available",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Gap(1.h),
              Text(
                "Document content will be loaded from the server.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.lightGrey,
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileItem(
      BuildContext context, String fileName, String fileSize) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file,
            color: AppColors.documentColor,
            size: 20,
          ),
          Gap(3.w),
          Expanded(
            child: Text(
              fileName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Text(
            fileSize,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.lightGrey,
                ),
          ),
        ],
      ),
    );
  }
}
