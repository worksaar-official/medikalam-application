// ignore_for_file: lines_longer_than_80_chars

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
// import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
// import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';
import 'package:Medikalam/src/providers/form/form_provider.dart';
import 'package:Medikalam/src/providers/registration/registration_provider.dart';
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';
// import 'package:Medikalam/src/views/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:Medikalam/src/views/widgets/buttons/custom_button.dart';
// import 'package:Medikalam/src/views/widgets/custom_container/custom_container_widget.dart';
import 'package:Medikalam/src/views/widgets/custom_container/file_upload_widget.dart';
import 'package:Medikalam/src/views/widgets/label_widget.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield.dart';
import 'package:Medikalam/src/views/widgets/qr_scanner.dart';

class RegisterVisitPage extends StatefulWidget {
  const RegisterVisitPage({super.key});

  @override
  State<RegisterVisitPage> createState() => _RegisterVisitPageState();
}

class _RegisterVisitPageState extends State<RegisterVisitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      resizeToAvoidBottomInset: true,
      appBar: backAppbar(context, 'Register Visit'),
      body: SingleChildScrollView(
        child: Consumer<RegistrationProvider>(
          builder: (context, provider, child) {
            return ReactiveForm(
              formGroup: context.read<FormProvider>().registrationForm,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header section with simple styling
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2563EB).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.medical_services_rounded,
                                  color: Color(0xFF2563EB),
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                'Patient Registration',
                                style: context.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.2.h),

                          // Mobile Number
                          HelperContainer(
                            title: 'Mobile Number',
                            widget: CustomTextfield(
                              hintText: 'Enter 10 digit mobile number',
                              keyboardType: TextInputType.phone,
                              formControlName: 'mobile',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validationMessages: {
                                'required': (error) =>
                                    'Mobile number is required',
                                'number': (error) =>
                                    'Please enter only numbers',
                                'minLength': (error) =>
                                    'Mobile number must be 10 digits',
                                'maxLength': (error) =>
                                    'Mobile number must be 10 digits',
                              },
                              prefixWidget: Transform.translate(
                                offset: const Offset(-6, 0),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text(
                                    '+91 ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 1.2.h),

                          // Patient Name field
                          HelperContainer(
                            title: 'Patient Name',
                            widget: CustomTextfield(
                              hintText: 'Enter patient name',
                              formControlName: 'patientName',
                              textCapitalization: TextCapitalization.words,
                              validationMessages: {
                                'required': (error) =>
                                    'Patient name is required',
                              },
                            ),
                          ),

                          SizedBox(height: 1.2.h),

                          // Year of Birth with age calculation
                          HelperContainer(
                            title: 'Year of Birth',
                            widget: CustomTextfield(
                              hintText: 'e.g. 1999',
                              keyboardType: TextInputType.number,
                              formControlName: 'year',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                              validationMessages: {
                                'required': (error) =>
                                    'Year of birth is required',
                                'number': (error) =>
                                    'Please enter a valid year',
                              },
                              suffixWidget:
                                  ReactiveValueListenableBuilder<String>(
                                formControlName: 'year',
                                builder: (context, control, child) {
                                  final String? yearValue = control.value;
                                  print(
                                      'Year value: $yearValue'); // Debug print

                                  if (yearValue == null ||
                                      yearValue.isEmpty ||
                                      yearValue.length != 4) {
                                    return const SizedBox.shrink();
                                  }

                                  final int? year = int.tryParse(yearValue);
                                  if (year == null ||
                                      year < 1900 ||
                                      year > 2025) {
                                    return const SizedBox.shrink();
                                  }

                                  final int age = 2025 - year;
                                  print('Calculated age: $age'); // Debug print

                                  return Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF10B981)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      'Age: $age',
                                      style:
                                          context.textTheme.bodySmall?.copyWith(
                                        color: const Color(0xFF10B981),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.5.h),

                    // Gender selection with modern compact design
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF7C3AED).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.person_rounded,
                                  color: Color(0xFF7C3AED),
                                  size: 14,
                                ),
                              ),
                              SizedBox(width: 1.5.w),
                              Text(
                                'Patient Gender',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: const Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.8.h),
                          // Compact gender buttons
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Row(
                              children: [
                                // Male option
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => provider.selectRadio("M"),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == "M"
                                            ? const Color(0xFF3B82F6)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: provider.selectedIndex == "M"
                                            ? [
                                                BoxShadow(
                                                  color: const Color(0xFF3B82F6)
                                                      .withOpacity(0.3),
                                                  blurRadius: 8,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.male,
                                            size: 16,
                                            color: provider.selectedIndex == "M"
                                                ? Colors.white
                                                : Colors.grey[600],
                                          ),
                                          SizedBox(width: 1.w),
                                          Text(
                                            'Male',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color:
                                                  provider.selectedIndex == "M"
                                                      ? Colors.white
                                                      : Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Female option
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => provider.selectRadio("F"),
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == "F"
                                            ? const Color(0xFFEC4899)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: provider.selectedIndex == "F"
                                            ? [
                                                BoxShadow(
                                                  color: const Color(0xFFEC4899)
                                                      .withOpacity(0.3),
                                                  blurRadius: 8,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ]
                                            : null,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.female,
                                            size: 16,
                                            color: provider.selectedIndex == "F"
                                                ? Colors.white
                                                : Colors.grey[600],
                                          ),
                                          SizedBox(width: 1.w),
                                          Text(
                                            'Female',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color:
                                                  provider.selectedIndex == "F"
                                                      ? Colors.white
                                                      : Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 1.5.h),

                    // Medical Documents section with file upload functionality
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF059669).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.folder_rounded,
                                  color: Color(0xFF059669),
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                'Medical Documents',
                                style: context.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Expanded(
                                child: FileUploadWidget(
                                  title: 'Previous Description',
                                  subtitle:
                                      'Upload previous medical descriptions',
                                  icon: Icons.description_outlined,
                                  color: const Color(0xFF0EA5E9),
                                  files: provider.previousDescriptionFiles,
                                  onTap: () =>
                                      _pickFiles(context, provider, true),
                                  onRemoveFile:
                                      provider.removePreviousDescriptionFile,
                                  isLoading: provider.isUploading,
                                ),
                              ),
                              Expanded(
                                child: FileUploadWidget(
                                  title: 'Old Report',
                                  subtitle: 'Upload old medical reports',
                                  icon: Icons.assessment_outlined,
                                  color: const Color(0xFF10B981),
                                  files: provider.oldReportFiles,
                                  onTap: () =>
                                      _pickFiles(context, provider, false),
                                  onRemoveFile: provider.removeOldReportFile,
                                  isLoading: provider.isUploading,
                                ),
                              ),
                            ],
                          ),

                          // File previews
                          if (provider.previousDescriptionFiles.isNotEmpty)
                            FilePreviewWidget(
                              files: provider.previousDescriptionFiles,
                              onRemoveFile:
                                  provider.removePreviousDescriptionFile,
                              title: 'Previous Description Files:',
                              getFileSize: _getFileSizeString,
                            ),

                          if (provider.oldReportFiles.isNotEmpty)
                            FilePreviewWidget(
                              files: provider.oldReportFiles,
                              onRemoveFile: provider.removeOldReportFile,
                              title: 'Old Report Files:',
                              getFileSize: _getFileSizeString,
                            ),

                          // Removed Upload All Files button as requested
                        ],
                      ),
                    ),

                    SizedBox(height: 2.h),

                    // Connect button with simple styling (restyled)
                    CustomButtonNew(
                      color: const Color(0xFF0EA5E9),
                      borderRadius: 12,
                      height: 6.5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.qr_code_scanner_outlined,
                              color: Colors.white, size: 20),
                          SizedBox(width: 1.w),
                          Text(
                            'Connect & Scan QR',
                            style: context.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QrScanner(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 1.2.h),

                    // Save button for Register Visit (restyled)
                    CustomButtonNew(
                      color: const Color(0xFF2563EB),
                      borderRadius: 12,
                      height: 6.5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.save_outlined,
                              color: Colors.white, size: 20),
                          SizedBox(width: 1.w),
                          Text(
                            'Save',
                            style: context.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        final form =
                            context.read<FormProvider>().registrationForm;
                        if (!form.valid) {
                          form.markAllAsTouched();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill required fields'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          return;
                        }
                        // TODO: Integrate with backend submit if available
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Saved successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _pickFiles(BuildContext context, RegistrationProvider provider,
      bool isPreviousDescription) async {
    // Show bottom sheet with camera/file options
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.3,
          maxChildSize: 0.6,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Choose Upload Method',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Select how you want to add your medical documents',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Options
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // Camera option
                        Expanded(
                          child: _buildOptionCard(
                            context: context,
                            icon: Icons.camera_alt,
                            title: 'Camera',
                            subtitle: 'Take Photo',
                            color: Colors.blue,
                            onTap: () {
                              Navigator.pop(context);
                              _pickFromCamera(
                                  context, provider, isPreviousDescription);
                            },
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Gallery option
                        Expanded(
                          child: _buildOptionCard(
                            context: context,
                            icon: Icons.photo_library,
                            title: 'Gallery',
                            subtitle: 'Select Files',
                            color: Colors.green,
                            onTap: () {
                              Navigator.pop(context);
                              _pickFromGallery(
                                  context, provider, isPreviousDescription);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Info section
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Supported formats: PDF, Images, Documents (Max 10MB each)',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 24,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                color: color.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFromCamera(BuildContext context,
      RegistrationProvider provider, bool isPreviousDescription) async {
    try {
      provider.setUploading(true);

      // Use image picker to take photo from camera
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 80, // Compress image to reduce size
      );

      if (image != null) {
        final file = File(image.path);

        // Validate file size
        if (_isValidFileSize(image.path)) {
          if (isPreviousDescription) {
            provider.addPreviousDescriptionFiles([file]);
          } else {
            provider.addOldReportFiles([file]);
          }

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Photo captured successfully'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Photo size too large (max 10MB)'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error capturing photo: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      provider.setUploading(false);
    }
  }

  Future<void> _pickFromGallery(BuildContext context,
      RegistrationProvider provider, bool isPreviousDescription) async {
    try {
      provider.setUploading(true);

      final List<String>? filePaths = await Helpers.pickFile_Android();

      if (filePaths != null && filePaths.isNotEmpty) {
        // Validate file types and sizes
        final validFiles = <String>[];
        final invalidFiles = <String>[];

        for (final path in filePaths) {
          if (_isValidFileType(path) && _isValidFileSize(path)) {
            validFiles.add(path);
          } else {
            invalidFiles.add(path);
          }
        }

        if (validFiles.isNotEmpty) {
          final files = validFiles.map((path) => File(path)).toList();

          if (isPreviousDescription) {
            provider.addPreviousDescriptionFiles(files);
          } else {
            provider.addOldReportFiles(files);
          }

          // Show success message
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '${files.length} file${files.length > 1 ? 's' : ''} selected successfully'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        }

        if (invalidFiles.isNotEmpty && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${invalidFiles.length} file${invalidFiles.length > 1 ? 's' : ''} skipped (unsupported format or size)'),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error selecting files: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      provider.setUploading(false);
    }
  }

  bool _isValidFileType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    const validExtensions = [
      'pdf',
      'jpg',
      'jpeg',
      'png',
      'gif',
      'doc',
      'docx',
      'xls',
      'xlsx',
      'txt',
      'rtf'
    ];
    return validExtensions.contains(extension);
  }

  bool _isValidFileSize(String filePath) {
    try {
      final file = File(filePath);
      final sizeInBytes = file.lengthSync();
      final sizeInMB = sizeInBytes / (1024 * 1024);
      // Limit file size to 10MB
      return sizeInMB <= 10;
    } catch (e) {
      return false;
    }
  }

  String _getFileSizeString(String filePath) {
    try {
      final file = File(filePath);
      final sizeInBytes = file.lengthSync();
      if (sizeInBytes < 1024) {
        return '${sizeInBytes}B';
      } else if (sizeInBytes < 1024 * 1024) {
        return '${(sizeInBytes / 1024).toStringAsFixed(1)}KB';
      } else {
        return '${(sizeInBytes / (1024 * 1024)).toStringAsFixed(1)}MB';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

  // Removed unused _uploadFiles method
}
