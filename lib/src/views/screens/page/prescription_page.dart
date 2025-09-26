// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/injection/image_service.dart';
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/models/page_config/page_config_response.dart';
import 'package:Medikalam/src/models/page_details/page_details_response.dart';
import 'package:Medikalam/src/views/widgets/custom_container/page_number.dart';

class PrescriptionPage extends StatefulWidget {
  final PageDetails page;
  const PrescriptionPage({super.key, required this.page});

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageNumber(context, widget.page.pageNumber ?? 0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: CustomPaint(
                size: Size(screenSize.width, screenSize.height),
                painter: PrescriptionCard(
                  bgImg: getIt<ImageService>().cachedImage!,
                  points: widget.page.points ?? [],
                  height: widget.page.pageHeight,
                  width: widget.page.pageWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrescriptionCard extends CustomPainter {
  ui.Image bgImg;
  List<Point> points;
  int height;
  int width;

  PrescriptionCard(
      {required this.bgImg,
      required this.points,
      required this.height,
      required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final double imageWidth = width.toDouble();
    final double imageHeight = height.toDouble();
    canvas.save();

    canvas.drawImageRect(
      bgImg,
      Rect.fromLTWH(0, 0, bgImg.width.toDouble(), bgImg.height.toDouble()),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );
    canvas.restore();

    final paint = Paint()
      ..strokeWidth = 1.5
      ..color = Colors.black
      ..strokeCap = StrokeCap.round // Add this for better dot rendering
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    if (points.isEmpty) {
      return; // No points to draw
    }

    // Create separate paths for each stroke to avoid connecting lines
    final List<Path> strokePaths = [];
    final List<Offset> isolatedDots = []; // Track isolated dots
    Path? currentPath;

    for (int i = 0; i < points.length; i++) {
      final Point point = points[i];
      final Offset offset =
          _getScaledOffset(imageHeight, imageWidth, size, point);

      if (point.actionType == 1) {
        // Pen down - start or continue stroke
        if (i == 0 || points[i - 1].actionType == 2) {
          // Start a new stroke
          currentPath = Path();
          currentPath.moveTo(offset.dx, offset.dy);
          strokePaths.add(currentPath);
        } else if (currentPath != null) {
          // Continue current stroke with smooth curve
          final previousOffset =
              _getScaledOffset(imageHeight, imageWidth, size, points[i - 1]);

          // Check if this is a very short movement (likely a dot or small stroke)
          final distance = (offset - previousOffset).distance;
          if (distance < paint.strokeWidth * 0.5) {
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
      } else if (point.actionType == 2) {
        // Pen up - finalize current stroke and check if it's an isolated dot
        if (currentPath != null) {
          // Add the final point to complete the stroke
          currentPath.lineTo(offset.dx, offset.dy);

          // Check if this was an isolated dot
          final pathMetrics = currentPath.computeMetrics();
          for (final pathMetric in pathMetrics) {
            if (pathMetric.length < paint.strokeWidth * 2) {
              // This is likely an isolated dot (very short stroke)
              final tangent = pathMetric.getTangentForOffset(0);
              if (tangent != null) {
                isolatedDots.add(tangent.position);
              }
            }
          }

          // Reset current path for next stroke
          currentPath = null;
        }
      }
    }

    // Handle case where the last point is a pen down (no pen up event)
    if (currentPath != null && points.isNotEmpty) {
      final lastPoint = points.last;
      if (lastPoint.actionType == 1) {
        final lastOffset =
            _getScaledOffset(imageHeight, imageWidth, size, lastPoint);
        currentPath.lineTo(lastOffset.dx, lastOffset.dy);
      }
    }

    // Draw all stroke paths
    for (final path in strokePaths) {
      canvas.drawPath(path, paint);
    }

    // Draw isolated dots with a filled circle for better visibility
    final dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    for (final dot in isolatedDots) {
      canvas.drawCircle(dot, paint.strokeWidth / 2, dotPaint);
    }
  }

  Offset _getScaledOffset(
      double bookHeight, double bookWidth, Size size, Point point) {
    double scaleX = size.width / bookWidth;
    double scaleY = size.height / bookHeight;

    return Offset(point.x.toDouble() * scaleX, point.y.toDouble() * scaleY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
