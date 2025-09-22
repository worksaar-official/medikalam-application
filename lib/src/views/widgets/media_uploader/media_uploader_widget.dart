// Flutter imports:
import 'package:flutter/material.dart';
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/keys.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';

class MediaUploaderWidget extends StatefulWidget {
  final String title;
  final String? subtitle;
  final List<String> selectedFilePaths; // Changed to store paths only
  final Function(List<String>) onFilesSelected; // Changed to handle paths
  final Function(String)? onFileRemoved; // Changed to handle path removal
  final bool isLoading;
  final List<String>? allowedExtensions;
  final double? maxFileSizeMB;
  final int? maxFiles;
  final String? pageId;
  final String? uid;
  final Function(List<String>)? onUploadSuccess;
  final Function(String)? onUploadError;

  const MediaUploaderWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.selectedFilePaths,
    required this.onFilesSelected,
    this.onFileRemoved,
    this.isLoading = false,
    this.allowedExtensions,
    this.maxFileSizeMB,
    this.maxFiles,
    this.pageId,
    this.uid,
    this.onUploadSuccess,
    this.onUploadError,
  });

  @override
  State<MediaUploaderWidget> createState() => _MediaUploaderWidgetState();
}

class _MediaUploaderWidgetState extends State<MediaUploaderWidget> {
  final ImagePicker _imagePicker = ImagePicker();
  final Dio _dio = Dio();
  bool _isUploading = false;
  Map<String, double> _uploadProgress = {};

  // Debug function to check upload status
  void _debugUploadStatus() {
    print('=== UPLOAD DEBUG STATUS ===');
    print('Is Uploading: $_isUploading');
    print('Selected Files Count: ${widget.selectedFilePaths.length}');
    print('Selected Files: ${widget.selectedFilePaths}');
    print('Upload Progress: $_uploadProgress');
    print('========================');
  }

  @override
  Widget build(BuildContext context) {
    print(
        'MediaUploaderWidget build: ${widget.selectedFilePaths.length} files');
    print('Files: ${widget.selectedFilePaths}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and subtitle
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
        ),
        if (widget.subtitle != null) ...[
          Gap(0.5.h),
          Text(
            widget.subtitle!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.lightGrey,
                  fontSize: 12.sp,
                ),
          ),
        ],
        Gap(1.h),

        // Upload button
        GestureDetector(
          onTap: widget.isLoading ? null : _showUploadOptions,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.isLoading
                    ? AppColors.lightGrey.withOpacity(0.3)
                    : AppColors.documentColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: widget.isLoading
                      ? AppColors.lightGrey
                      : AppColors.documentColor,
                  size: 20,
                ),
                Gap(2.w),
                Expanded(
                  child: Text(
                    widget.isLoading ? 'Uploading...' : 'Choose Files',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: widget.isLoading
                              ? AppColors.lightGrey
                              : AppColors.documentColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                if (widget.isLoading)
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.documentColor,
                      ),
                    ),
                  )
                else
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.documentColor,
                    size: 16,
                  ),
              ],
            ),
          ),
        ),

        // Selected files display
        if (widget.selectedFilePaths.isNotEmpty) ...[
          Gap(1.5.h),
          Text(
            'Selected Files (${widget.selectedFilePaths.length}${widget.maxFiles != null ? '/${widget.maxFiles}' : ''})',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Gap(1.h),
          ...widget.selectedFilePaths.asMap().entries.map((entry) {
            final index = entry.key;
            final filePath = entry.value;
            return _buildFileItem(context, filePath, index);
          }),

          // Upload button with debug
          Gap(2.h),
          _buildUploadButton(),

          // Debug button
          Gap(1.h),
          ElevatedButton(
            onPressed: _debugUploadStatus,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 1.h),
            ),
            child: Text('Debug Upload Status',
                style: TextStyle(color: Colors.white)),
          ),

          // Upload progress indicators
          if (_isUploading) ...[
            Gap(1.h),
            ...widget.selectedFilePaths.asMap().entries.map((entry) {
              final index = entry.key;
              final filePath = entry.value;
              final fileName = filePath.split('/').last;
              return _buildUploadProgressItem(fileName, index);
            }),
          ],
        ],
      ],
    );
  }

  Widget _buildFileItem(BuildContext context, String filePath, int index) {
    final fileName = filePath.split('/').last;
    final fileSize = _getFileSizeString(filePath);
    final extension = fileName.split('.').last.toLowerCase();

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
          // File icon based on extension
          Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: _getFileTypeColor(extension).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              _getFileTypeIcon(extension),
              color: _getFileTypeColor(extension),
              size: 16,
            ),
          ),
          Gap(2.w),
          // File info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(0.2.h),
                Text(
                  fileSize,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.lightGrey,
                        fontSize: 10.sp,
                      ),
                ),
              ],
            ),
          ),
          // Remove button
          if (widget.onFileRemoved != null)
            GestureDetector(
              onTap: () {
                // Show confirmation dialog before removing
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Remove File'),
                      content: Text(
                          'Are you sure you want to remove "${fileName}"?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            widget.onFileRemoved!(filePath);
                            // Show feedback
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('"$fileName" removed'),
                                backgroundColor: Colors.orange,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          child: const Text('Remove',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showUploadOptions() {
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
                    margin: EdgeInsets.only(top: 1.h),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Gap(2.h),

                  // Title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      'Choose Upload Method',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                    ),
                  ),
                  Gap(2.h),

                  // Options
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                              _pickFromCamera();
                            },
                          ),
                        ),
                        Gap(4.w),

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
                              _pickFromGallery();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  Gap(2.h),

                  // Info section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        Gap(2.w),
                        Expanded(
                          child: Text(
                            'Supported formats: PDF, Images, Documents (Max ${widget.maxFileSizeMB ?? 10}MB each)',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                      fontSize: 11.sp,
                                    ),
                          ),
                        ),
                      ],
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
        height: 12.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
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
            Gap(1.h),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
                fontSize: 14.sp,
              ),
            ),
            Gap(0.2.h),
            Text(
              subtitle,
              style: TextStyle(
                color: color.withOpacity(0.7),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        final filePath = image.path;
        print('Camera file path: $filePath');

        // Check if file exists
        final file = File(filePath);
        print('File exists: ${file.existsSync()}');

        if (_isValidFile(filePath)) {
          final newPaths = [...widget.selectedFilePaths, filePath];
          print(
              'Camera: Calling onFilesSelected with ${newPaths.length} files');
          print('New paths: $newPaths');
          widget.onFilesSelected(newPaths);

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Photo captured successfully'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid file format or size'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      }
    } catch (e) {
      print('Camera error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error capturing photo: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      // Use ImagePicker for multiple image selection
      final List<XFile>? images = await _imagePicker.pickMultiImage(
        imageQuality: 80,
      );

      if (images != null && images.isNotEmpty) {
        final validPaths = <String>[];
        final invalidFiles = <String>[];

        for (final image in images) {
          final filePath = image.path;
          print('Gallery file path: $filePath');

          // Check if file exists
          final file = File(filePath);
          print('File exists: ${file.existsSync()}');

          if (!file.existsSync()) {
            print('File does not exist: $filePath');
            invalidFiles.add(filePath);
            continue;
          }

          if (_isValidFile(filePath)) {
            print('File is valid: $filePath');
            validPaths.add(filePath);
          } else {
            print('File is invalid: $filePath');
            invalidFiles.add(filePath);
          }
        }

        if (validPaths.isNotEmpty) {
          final newPaths = [...widget.selectedFilePaths, ...validPaths];
          print(
              'Gallery: Calling onFilesSelected with ${newPaths.length} files');
          print('New paths: $newPaths');
          widget.onFilesSelected(newPaths);

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '${validPaths.length} file${validPaths.length > 1 ? 's' : ''} selected successfully'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        }

        if (invalidFiles.isNotEmpty && mounted) {
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error selecting files: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  bool _isValidFile(String filePath) {
    // Check file type
    if (!_isValidFileType(filePath)) {
      return false;
    }

    // Check file size
    if (!_isValidFileSize(filePath)) {
      return false;
    }

    // Check max files limit
    if (widget.maxFiles != null &&
        widget.selectedFilePaths.length >= widget.maxFiles!) {
      return false;
    }

    return true;
  }

  bool _isValidFileType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    final allowedExtensions = widget.allowedExtensions ??
        [
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
    return allowedExtensions.contains(extension);
  }

  bool _isValidFileSize(String filePath) {
    try {
      final file = File(filePath);
      if (!file.existsSync()) {
        return false;
      }
      final sizeInBytes = file.lengthSync();
      final sizeInMB = sizeInBytes / (1024 * 1024);
      final maxSize = widget.maxFileSizeMB ?? 10.0;
      return sizeInMB <= maxSize;
    } catch (e) {
      print('Error checking file size: $e');
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

  Color _getFileTypeColor(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return Colors.red;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Colors.green;
      case 'doc':
      case 'docx':
        return Colors.blue;
      case 'xls':
      case 'xlsx':
        return Colors.green[700]!;
      case 'txt':
      case 'rtf':
        return Colors.grey[600]!;
      default:
        return AppColors.documentColor;
    }
  }

  IconData _getFileTypeIcon(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'txt':
      case 'rtf':
        return Icons.text_snippet;
      default:
        return Icons.insert_drive_file;
    }
  }

  Widget _buildUploadButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (_isUploading || widget.selectedFilePaths.isEmpty)
            ? null
            : _uploadFiles,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.documentColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isUploading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  Gap(2.w),
                  Text(
                    'Uploading...',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : Text(
                'Upload Files',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildUploadProgressItem(String fileName, int index) {
    final progress = _uploadProgress[fileName] ?? 0.0;

    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.cloud_upload,
                color: AppColors.documentColor,
                size: 16,
              ),
              Gap(2.w),
              Expanded(
                child: Text(
                  fileName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.documentColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          Gap(1.h),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.documentColor),
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Future<void> _uploadFiles() async {
    print('=== UPLOAD STARTED ===');
    print('Upload button clicked!');
    print('Selected files count: ${widget.selectedFilePaths.length}');
    _debugUploadStatus();

    if (widget.selectedFilePaths.isEmpty) {
      print('No files to upload!');
      return;
    }

    setState(() {
      _isUploading = true;
      _uploadProgress.clear();
    });

    final uploadedUrls = <String>[];

    try {
      for (int i = 0; i < widget.selectedFilePaths.length; i++) {
        final filePath = widget.selectedFilePaths[i];
        final fileName = filePath.split('/').last;

        print('Processing file $i: $fileName');
        print('File path: $filePath');

        setState(() {
          _uploadProgress[fileName] = 0.0;
        });

        try {
          final uploadedUrl = await _uploadSingleFile(filePath, fileName);
          uploadedUrls.add(uploadedUrl);

          setState(() {
            _uploadProgress[fileName] = 1.0;
          });
        } catch (e) {
          print('Error uploading file $fileName: $e');
          if (widget.onUploadError != null) {
            widget.onUploadError!('Failed to upload $fileName: $e');
          }
        }
      }

      if (uploadedUrls.isNotEmpty && widget.onUploadSuccess != null) {
        widget.onUploadSuccess!(uploadedUrls);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${uploadedUrls.length} file${uploadedUrls.length > 1 ? 's' : ''} uploaded successfully'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  Future<String> _uploadSingleFile(String filePath, String fileName) async {
    try {
      print('Starting upload for file: $fileName');
      print('File path: $filePath');

      final file = File(filePath);
      print('File exists: ${file.existsSync()}');
      print('File size: ${file.existsSync() ? file.lengthSync() : 0} bytes');

      final formData = FormData.fromMap({
        'media': await MultipartFile.fromFile(
          filePath,
          filename: fileName,
        ),
        if (widget.pageId != null) 'pageId': widget.pageId!,
        if (widget.uid != null) 'uid': widget.uid!,
      });

      print('FormData created');
      print('API URL: https://medikalam.worksaar.com/api/media/upload');
      print('PageId: ${widget.pageId}');
      print('Uid: ${widget.uid}');
      print('File: $fileName');
      print('File path: $filePath');

      // Debug FormData fields
      print('FormData fields:');
      formData.fields.forEach((field) {
        print('  ${field.key}: ${field.value}');
      });
      print('FormData files:');
      formData.files.forEach((file) {
        print('  ${file.key}: ${file.value.filename}');
      });

      // Get authentication token from session storage
      final token = Helpers.getString(key: Keys.token);
      print(
          'Auth token: ${token != null ? "Present (${token.length} chars)" : "Missing"}');

      final response = await _dio.post(
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
        onSendProgress: (sent, total) {
          final progress = sent / total;
          print('Upload progress: ${(progress * 100).toInt()}%');
          setState(() {
            _uploadProgress[fileName] = progress;
          });
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 && response.data['success'] == true) {
        final publicUrl = response.data['data']['publicUrl'];
        print('Upload successful! Public URL: $publicUrl');
        return publicUrl;
      } else {
        print(
            'Upload failed - Status: ${response.statusCode}, Data: ${response.data}');
        throw Exception(
            'Upload failed: ${response.data['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      print('Upload error: $e');
      rethrow;
    }
  }
}