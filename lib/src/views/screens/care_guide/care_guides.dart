// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/providers/auth/auth_provider.dart';
import 'package:Medikalam/src/providers/guide/guide_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/bottomsheet/upload_bottomsheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
import 'package:Medikalam/src/views/widgets/custom_container/care_guide_widgets.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';

class CareGuidePage extends StatefulWidget {
  const CareGuidePage({super.key});

  @override
  State<CareGuidePage> createState() => _CareGuidePageState();
}

class _CareGuidePageState extends State<CareGuidePage> {

  @override
  void didChangeDependencies() {
    context.read<CareGuideProvider>().getCareGuides('','');
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: backAppbar(context, 'Care Guide'),
      body: SingleChildScrollView(
        child: Consumer<CareGuideProvider>(
          builder: (context,provider,child) {
            if (provider.careGuides.isEmpty) {
              return const Center(
                child: Text('No Care Guides Available'),
              );
            }
            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.careGuides.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: careGuideWidget(
                        title: provider.careGuides[index].name,
                        desc: provider.careGuides[index].description,
                        theme: context.textTheme,
                      ),
                    );
                  },
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Consumer<CareGuideProvider>(
            builder: (context, provider, child) {
              return FloatingActionButton.extended(
                onPressed: () {
                  careguidebottomSheet(
                    context: context,
                    ontap: () {
                      custombottomSheet(
                        context: context,
                        child: SizedBox(
                          height: 55.h,
                          child: ReactiveForm(
                            formGroup: provider.form,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Add care guide',
                                    style: context.textTheme.bodyMedium!.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  const HelperContainer(
                                    title: 'Audio name',
                                    widget: CustomTextfield(
                                      hintText: 'Enter name',
                                      formControlName: 'name',
                                    ),
                                  ),
                                  const HelperContainer(
                                    title: 'Description',
                                    widget: CustomTextfield(
                                      hintText: ' Enter Description',
                                      formControlName: 'description',
                                      maxLines: 2,
                                    ),
                                  ),
                                  CustomButtonNew(
                                    text: 'Upload Audio',
                                    style:
                                        context.textTheme.labelMedium!.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 12,
                                    ),
                                    color: AppColors.offWhite,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  CustomButtonNew(
                                    text: 'Record Audio',
                                    style:
                                        context.textTheme.labelMedium!.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 12,
                                    ),
                                    color: AppColors.offWhite,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  const CustomButtonNew(
                                    text: 'Save Guide',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    ontap1: () {
                      custombottomSheet(
                        context: context,
                        child: SizedBox(
                          height: 55.h,
                          child: ReactiveForm(
                            formGroup: provider.form,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Add care guide',
                                    style: context.textTheme.bodyMedium!.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  const HelperContainer(
                                    title: 'Video name',
                                    widget: CustomTextfield(
                                      hintText: 'Enter name',
                                      formControlName: 'name',
                                    ),
                                  ),
                                  const HelperContainer(
                                    title: 'Description',
                                    widget: CustomTextfield(
                                      hintText: 'Enter Description',
                                      formControlName: 'description',
                                      maxLines: 2,
                                    ),
                                  ),
                                  const HelperContainer(
                                    title: 'Link to video ',
                                    widget: CustomTextfield(
                                      hintText: 'Enter URL',
                                      formControlName: 'url',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Builder(
                                    builder: (context) {
                                      return CustomButtonNew(
                                        text: 'Save Guide',
                                        onTap: () async{
                                          final authProvider = context.read<AuthProvider>();
                                          if(authProvider.user != null) {
                                            await provider.addVideoGuide(authProvider.user!.id!, authProvider.user!.hospital.id!);
                                          } else {
                                            
                                          }
                                        },
                                      );
                                    }
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                backgroundColor: AppColors.lightSky,
                label: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.btnPrimary,
                    ),
                    Text(
                      'New Guides',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.txtPrimary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
