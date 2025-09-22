// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
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
  bool isUploadingNormalPrescription = false;
  List<String> selectedFilePaths = [];
  String? currentPatientId;
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
                            GestureDetector(
                              onTap: () {
                                // Close the current modal
                                Navigator.pop(context);
                                // Show camera/gallery options directly
                                _showCameraGalleryOptions(context, patient.id);
                              },
                              child: addDocumentWidget(
                                theme: context.textTheme,
                                img: 'assets/icons/presc.svg',
                                title: 'Normal Presciption',
                                desc:
                                    'You can add image of old non Medikalam prescription',
                              ),
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

  void _showCameraGalleryOptions(BuildContext context, String patientId) {
    print('Showing camera/gallery options for patient ID: $patientId');

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Gap(3.h),

                // Title
                Text(
                  'Select Upload Method',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                ),
                Gap(2.h),

                // Camera Option
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _pickFromCamera(patientId);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.blue[700],
                          size: 24,
                        ),
                        Gap(4.w),
                        Text(
                          'Take Photo',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue[700],
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(2.h),

                // Gallery Option
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _pickFromGallery(patientId);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_library,
                          color: Colors.green[700],
                          size: 24,
                        ),
                        Gap(4.w),
                        Text(
                          'Choose from Gallery',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green[700],
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(2.h),

                // Cancel Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                    ),
                  ),
                ),
                Gap(2.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickFromCamera(String patientId) async {
    try {
      print('Taking photo for patient: $patientId');

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        print('Photo taken: ${image.path}');
        // Store the image and show preview
        setState(() {
          selectedFilePaths = [image.path];
          currentPatientId = patientId;
        });
        _showPreviewModal(context);
      } else {
        print('No photo taken');
      }
    } catch (e) {
      print('Camera error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Camera error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _pickFromGallery(String patientId) async {
    try {
      print('Selecting from gallery for patient: $patientId');

      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (images.isNotEmpty) {
        print('Selected ${images.length} images');
        // Store the images and show preview
        setState(() {
          selectedFilePaths = images.map((e) => e.path).toList();
          currentPatientId = patientId;
        });
        _showPreviewModal(context);
      } else {
        print('No images selected');
      }
    } catch (e) {
      print('Gallery error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gallery error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showPreviewModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Handle bar
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Gap(2.h),

                  // Header
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        Text(
                          'Preview Files (${selectedFilePaths.length})',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            // Clear selected files
                            setState(() {
                              selectedFilePaths.clear();
                              currentPatientId = null;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(1.w),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.grey[600],
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(2.h),

                  // Preview Images
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: GridView.builder(
                        controller: scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                        itemCount: selectedFilePaths.length,
                        itemBuilder: (context, index) {
                          final filePath = selectedFilePaths[index];
                          return _buildPreviewItem(context, filePath, index);
                        },
                      ),
                    ),
                  ),
                  Gap(2.h),

                  // Upload Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isUploadingNormalPrescription
                            ? null
                            : () => _uploadAllFiles(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btnPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isUploadingNormalPrescription
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Upload ${selectedFilePaths.length} File(s)',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Gap(2.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPreviewItem(BuildContext context, String filePath, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Stack(
        children: [
          // Image preview
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              File(filePath),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.grey[400],
                    size: 40,
                  ),
                );
              },
            ),
          ),

          // Remove button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _removeFile(index),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),

          // File info
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                filePath.split('/').last,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeFile(int index) {
    setState(() {
      selectedFilePaths.removeAt(index);
    });

    if (selectedFilePaths.isEmpty) {
      Navigator.pop(context);
      setState(() {
        currentPatientId = null;
      });
    }
  }

  Future<void> _uploadAllFiles() async {
    if (currentPatientId == null || selectedFilePaths.isEmpty) return;

    try {
      setState(() {
        isUploadingNormalPrescription = true;
      });

      int successCount = 0;
      int failCount = 0;

      for (String filePath in selectedFilePaths) {
        try {
          await _uploadSingleFile(filePath, currentPatientId!);
          successCount++;
        } catch (e) {
          print('Failed to upload $filePath: $e');
          failCount++;
        }
      }

      setState(() {
        isUploadingNormalPrescription = false;
      });

      // Show result message
      String message;
      if (successCount > 0 && failCount == 0) {
        message = 'All $successCount file(s) uploaded successfully!';
      } else if (successCount > 0 && failCount > 0) {
        message = '$successCount file(s) uploaded, $failCount failed';
      } else {
        message = 'Upload failed for all files';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: successCount > 0 ? Colors.green : Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );

      // Close modal and clear files
      Navigator.pop(context);
      setState(() {
        selectedFilePaths.clear();
        currentPatientId = null;
      });
    } catch (e) {
      setState(() {
        isUploadingNormalPrescription = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Upload error: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _uploadSingleFile(String filePath, String patientId) async {
    print('Uploading file: $filePath for patient: $patientId');

    final fileName = filePath.split('/').last;

    final dio = Dio();

    // Create FormData with correct field names
    final formData = FormData.fromMap({
      'mediaFile': await MultipartFile.fromFile(filePath, filename: fileName),
      'pageId': 'patient_document',
      'uid': patientId,
    });

    print('Uploading with parameters:');
    print('- mediaFile: $fileName');
    print('- pageId: patient_document');
    print('- uid: $patientId');
    print('- File size: ${File(filePath).lengthSync()} bytes');
    print('- Full file path: $filePath');

    // Get authentication token
    final token = Helpers.getString(key: Keys.token);
    print('Auth token: ${token != null ? "Present" : "Missing"}');

    // Debug FormData fields
    print('FormData fields:');
    formData.fields.forEach((field) {
      print('  ${field.key}: ${field.value}');
    });
    print('FormData files:');
    formData.files.forEach((file) {
      print('  ${file.key}: ${file.value.filename}');
    });

    final response = await dio.post(
      'https://medikalam.worksaar.com/api/media/upload',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          if (token != null) 'x-access-token': token,
        },
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    print('Upload successful: ${response.statusCode}');
    print('Response: ${response.data}');
  }
}
