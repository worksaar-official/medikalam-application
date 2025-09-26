// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/injection/image_service.dart';
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/models/pen/afdot.dart';
import 'package:Medikalam/src/providers/prescription/audio_provider.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';
import 'package:Medikalam/src/views/widgets/custom_container/page_number.dart';

class NewPrescriptionPage extends StatefulWidget {
  const NewPrescriptionPage({super.key});

  @override
  State<NewPrescriptionPage> createState() => _NewPrescriptionPageState();
}

class _NewPrescriptionPageState extends State<NewPrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PrescriptionProvider>(
      builder: (context, provider, child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pageNumber(context, provider.pageNumber),
              Consumer<AudioProvider>(builder: (context, audioProvider, child) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (audioProvider.path != null) {
                          await provider.saveAudioFile(
                            audioProvider.path!,
                          );
                        }
                      },
                      icon: Icon(Icons.save, color: AppColors.btnPrimary),
                    ),
                    IconButton(
                      onPressed: () async {
                        audioProvider.playOrPause();
                      },
                      icon: Icon(
                          audioProvider.playerController.playerState.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: AppColors.btnPrimary),
                    ),
                    IconButton(
                      onPressed: () async {
                        audioProvider.startOrStopRecording();
                      },
                      icon: Icon(
                          audioProvider.isRecording ? Icons.stop : Icons.mic,
                          color: AppColors.btnPrimary),
                    ),
                  ],
                );
              }),
            ],
          ),
          if (getIt<ImageService>().cachedImage != null)
            SizedBox(
              width: 96.w,
              height: 65.h,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: CustomPaint(
                  key: ValueKey(provider.dots.length),
                  size: Size.infinite,
                  painter: PenPathPainter(
                    backgroundImage: getIt<ImageService>().cachedImage!,
                    afdots: provider.dots,
                  ),
                ),
              ),
            )
        ]);
      },
    );
  }
}

class PenPathPainter extends CustomPainter {
  final List<Afdot> afdots;
  final ui.Image backgroundImage;
  final double strokeWidth;
  final Color strokeColor;

  PenPathPainter({
    required this.afdots,
    required this.backgroundImage,
    this.strokeWidth = 1.0,
    this.strokeColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the background image
    final srcRect = Rect.fromLTWH(
      0.0,
      0.0,
      backgroundImage.width.toDouble(),
      backgroundImage.height.toDouble(),
    );

    final destRect = Rect.fromLTWH(
      0.0,
      0.0,
      size.width,
      size.height,
    );

    canvas.drawImageRect(backgroundImage, srcRect, destRect, Paint());

    // Draw the pen path
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round // Add this for better dot rendering
      ..style = PaintingStyle.stroke;

    // Create separate paths for each stroke to avoid connecting lines
    final List<Path> strokePaths = [];
    final List<Offset> isolatedDots = []; // Track isolated dots
    Path? currentPath;

    for (int i = 0; i < afdots.length; i++) {
      final Afdot dot = afdots[i];
      final Offset offset = _getScaledOffset(dot, size);

      if (dot.type == 1) {
        // Pen down - start or continue stroke
        if (i == 0 || afdots[i - 1].type == 2) {
          // Start a new stroke
          currentPath = Path();
          currentPath.moveTo(offset.dx, offset.dy);
          strokePaths.add(currentPath);
        } else if (currentPath != null) {
          // Continue current stroke with smooth curve
          final previousOffset = _getScaledOffset(afdots[i - 1], size);

          // Check if this is a very short movement (likely a dot or small stroke)
          final distance = (offset - previousOffset).distance;
          if (distance < strokeWidth * 0.5) {
            // For very short movements, just add a line to ensure visibility
            currentPath.lineTo(offset.dx, offset.dy);
          } else {
            // For longer movements, use smooth curve
            final midPoint = Offset(
              (previousOffset.dx + offset.dx) / 2,
              (previousOffset.dy + offset.dy) / 2,
            );
            currentPath.quadraticBezierTo(
              previousOffset.dx,
              previousOffset.dy,
              midPoint.dx,
              midPoint.dy,
            );
          }
        }
      } else if (dot.type == 2) {
        // Pen up - finalize current stroke and check if it's an isolated dot
        if (currentPath != null) {
          // Add the final point to complete the stroke
          currentPath.lineTo(offset.dx, offset.dy);

          // Check if this was an isolated dot
          final pathMetrics = currentPath.computeMetrics();
          for (final pathMetric in pathMetrics) {
            if (pathMetric.length < strokeWidth * 2) {
              // This is likely an isolated dot (very short stroke)
              final tangent = pathMetric.getTangentForOffset(0);
              if (tangent != null) {
                isolatedDots.add(tangent.position);
              }
            }
          }

          // Reset current path for next stroke hi
          currentPath = null;
        }
      }
    }

    // Handle case where the last point is a pen down (no pen up event)
    if (currentPath != null && afdots.isNotEmpty) {
      final lastDot = afdots.last;
      if (lastDot.type == 1) {
        final lastOffset = _getScaledOffset(lastDot, size);
        currentPath.lineTo(lastOffset.dx, lastOffset.dy);
      }
    }

    // Draw all stroke paths
    for (final path in strokePaths) {
      canvas.drawPath(path, paint);
    }

    // Draw isolated dots with a filled circle for better visibility
    final dotPaint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.fill;

    for (final dot in isolatedDots) {
      canvas.drawCircle(dot, strokeWidth / 2, dotPaint);
    }
  }

  Offset _getScaledOffset(Afdot dot, Size size) {
    double scaleX = size.width / dot.bookWidth.toDouble();
    double scaleY = size.height / dot.bookHeight.toDouble();

    return Offset(dot.x.toDouble() * scaleX, dot.y.toDouble() * scaleY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
