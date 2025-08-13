// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({
    super.key,
  });
  @override
  // ignore: library_private_types_in_public_api
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<String> media = [];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppbar(context, 'Report'),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: media.isNotEmpty? Image.file(File(media[selectedIndex])):Container(),
                ),
              ),
              const SizedBox(height: 32),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...media.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = media.indexOf(e);
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGrey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.file(File(e)),
                          ),
                        ),
                      );
                    }),
                    // Container(
                    //   height: 100,
                    //   width: 100,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: AppColors.lightGrey),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: const Center(
                    //     child: Icon(Icons.file_copy),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () async {
                        if (Platform.isAndroid) {
                          final mediaResponse = await Helpers.pickFile_Android();
                          if (mediaResponse != null) {
                            setState(() {
                              for (var element in mediaResponse) {
                                media.add(element);
                              }
                            });
                          }
                        }
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              CustomButtonNew(
                text: 'Save',
                onTap: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
