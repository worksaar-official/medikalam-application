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
      ..strokeWidth = 1
      ..isAntiAlias = true
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (int i = 0; i < afdots.length; i++) {
      final Afdot dot = afdots[i];
      final Offset offset = _getScaledOffset(dot, size);

      if (dot.type == 1) {
        if (i == 0 || afdots[i - 1].type == 2) {
          path.moveTo(offset.dx, offset.dy);
        } else {
          final previousOffset = _getScaledOffset(afdots[i - 1], size);
          final midPoint = Offset(
            (previousOffset.dx + offset.dx) / 2,
            (previousOffset.dy + offset.dy) / 2,
          );
          path.quadraticBezierTo(
            previousOffset.dx,
            previousOffset.dy,
            midPoint.dx,
            midPoint.dy,
          );
        }
      }
    }

    canvas.drawPath(path, paint);
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
