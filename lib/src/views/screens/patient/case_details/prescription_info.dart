// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/views/screens/page/prescription_page.dart';
import 'package:Medikalam/src/views/widgets/wrapper/status_handler.dart';

class PrescriptionInfoTab extends StatefulWidget {
  const PrescriptionInfoTab({super.key});

  @override
  State<PrescriptionInfoTab> createState() => _PrescriptionInfoTabState();
}

class _PrescriptionInfoTabState extends State<PrescriptionInfoTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PatientProvider>(builder: (context, provider, child) {
      return StatusHandler(
        status: provider.caseStatus,
        onSuccess: Column(
          children: [
            _title(
                name: provider.caseDetails.data!.patient.name ?? 'N/A',
                gender: provider.caseDetails.data!.patient.gender ?? 'N/A',
                age: "23 Years"),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: provider.pageDetailsList.length,
                  itemBuilder: (context, index) {
                    final page = provider.pageDetailsList[index];
                    return PrescriptionPage(page: page);
                  }),
            )
          ],
        ),
      );
    });
  }

  Widget _title(
      {required String name, required String gender, required String age}) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.5.h),
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
          SvgPicture.asset("assets/icons/appoint.svg", height: 6.h)
        ],
      ),
    );
  }
}
