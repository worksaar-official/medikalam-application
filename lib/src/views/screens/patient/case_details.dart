// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/views/screens/patient/case_details/case_info.dart';
import 'package:Medikalam/src/views/screens/patient/case_details/prescription_info.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';

class CaseDetails extends StatefulWidget {
  final String caseId;
  const CaseDetails({required this.caseId, super.key});

  @override
  State<CaseDetails> createState() => _CaseDetailsState();
}

class _CaseDetailsState extends State<CaseDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PatientProvider>().viewCase(widget.caseId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: backAppbar(
          context,
          'Case Details',
          tabs: TabBar(
            labelStyle: context.textTheme.bodyMedium!
                .copyWith(fontSize: 14, color: AppColors.txtSecondary),
            tabs: const [
              Tab(text: 'Prescription'),
              Tab(text: 'Case Info'),
            ],
            indicatorColor: AppColors.txtPrimary,
            labelColor: AppColors.txtPrimary,
            unselectedLabelColor: AppColors.blackColor,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: const Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [PrescriptionInfoTab(), CaseInfo()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
