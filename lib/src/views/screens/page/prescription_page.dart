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
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (points.length < 2) {
      return; // Not enough points to draw
    }

    // Start at the first point
    path.moveTo(
      _getScaledOffset(imageHeight, imageWidth, size, points[0]).dx,
      _getScaledOffset(imageHeight, imageWidth, size, points[0]).dy,
    );

    for (int i = 0; i < points.length - 1; i++) {
      final p1 = _getScaledOffset(imageHeight, imageWidth, size, points[i]);
      final p2 = _getScaledOffset(imageHeight, imageWidth, size, points[i + 1]);

      // Use the midpoint to create a smooth curve
      final midPoint = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);

      path.quadraticBezierTo(p1.dx, p1.dy, midPoint.dx, midPoint.dy);
    }

    // Draw the final segment
    path.lineTo(
      _getScaledOffset(imageHeight, imageWidth, size, points.last).dx,
      _getScaledOffset(imageHeight, imageWidth, size, points.last).dy,
    );

    canvas.drawPath(path, paint);
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
