// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/patient/patient_provider.dart';
import 'package:Medikalam/src/views/mixins/paginated_searchable_mixin.dart';
import 'package:Medikalam/src/views/widgets/wrapper/status_handler.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../widgets/bottomsheet/custom_bottom_sheet.dart';
import '../../../widgets/custom_container/custom_container_widget.dart';
import '../../../widgets/search_field.dart';

class AddDocuments extends StatefulWidget {
 const AddDocuments({super.key});

  @override
  State<AddDocuments> createState() => _AddDocumentsState();
}

class _AddDocumentsState extends State<AddDocuments>
    with PaginatedSearchableMixin<AddDocuments, PatientProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          onSuccess: ListView(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            children: [
              ...provider.entities.map((patient) {
                return PatientCard(
                  title: patient.fullName,
                  desc: patient.mobileNumber.toString(),
                  theme: context.textTheme,
                  onTap: () async {
                    custombottomSheet(
                      context: context,
                      child: SizedBox(
                        height: 43.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 1.h,
                              ),
                              child: Text(
                                'Attach Documents',
                                style: context.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.documentColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            addDocumentWidget(
                              theme: context.textTheme,
                              img: 'assets/icons/presc.svg',
                              title: 'Normal Presciption',
                              desc:
                                  'You can add image of old non Medikalam prescription',
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: addDocumentWidget(
                                theme: context.textTheme,
                                img: 'assets/icons/report.svg',
                                title: 'Report',
                                desc:
                                    'You can add clinical notes, vital signs, lab records files etc ',
                              ),
                            ),
                            addDocumentWidget(
                              theme: context.textTheme,
                              img: 'assets/icons/scan.svg',
                              title: 'Scan Document',
                              desc:
                                  'You can add clinical notes, vital signs, lab records files etc ',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
            ],
          ),
        );
      }),
    );
  }
}
