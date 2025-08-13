// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/core/utils/helpers/notification_helper.dart';
import 'package:Medikalam/src/providers/prescription/prescription_provider.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner>
    with SingleTickerProviderStateMixin {
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
    autoStart: true,
  );

  late final ValueNotifier<TorchState> showTorch;

  late final AnimationController _lineController;
  late final Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    showTorch = ValueNotifier<TorchState>(TorchState.off);

    _lineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _lineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _lineController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    showTorch.dispose();
    _lineController.dispose();
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final overlaySize = screenSize.width * 0.7;
    final scanWindow = Rect.fromCenter(
      center: Offset(screenSize.width / 2, screenSize.height / 2),
      width: overlaySize,
      height: overlaySize,
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: ValueListenableBuilder<TorchState>(
              valueListenable: showTorch,
              builder: (context, state, _) {
                return Icon(
                    state == TorchState.on ? Icons.flash_on : Icons.flash_off);
              },
            ),
            onPressed: () async {
              await controller.toggleTorch();
              showTorch.value = showTorch.value == TorchState.off
                  ? TorchState.on
                  : TorchState.off;
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.flip_camera_ios,
            ),
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            scanWindow: scanWindow,
            fit: BoxFit.cover,
            onDetect: (barcode) async {
              final List<Barcode> codes = barcode.barcodes;
              if (codes.isNotEmpty) {
                final String? rawVal = codes.first.rawValue;
                // print("QR Code: ${rawVal}");
                if (rawVal != null ) {
                  try {
                    final Map<String, dynamic> res = jsonDecode(rawVal);
                    final pageNumber = res["pageNumber"];
                    context.read<PrescriptionProvider>().isScan = true;
                    context.read<PrescriptionProvider>().pageNumber = pageNumber;
                    // context.pushReplacement(AppScreens.prescriptionPaper.path);
                    context.pushReplacementNamed(
                      AppScreens.patientLanding.name,
                      extra: {
                        'operationMode': OperationMode.render,
                        'showBottomSheet': true,
                      },);
                    
                  } catch (e) {
                    logger.e("Invalid QR content: $rawVal");
                    EasyLoading.dismiss();
                    showError("Invalid QR content: $rawVal");
                  }
                }
              }
            },
          ),
          _buildOverlay(size),
        ],
      ),
    );
  }

  Widget _buildOverlay(Size screenSize) {
    final overlaySize = screenSize.width * 0.7;
    return Center(
      child: SizedBox(
        width: overlaySize,
        height: overlaySize,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(overlaySize, overlaySize),
              painter: _ScannerOverlayPainter(overlaySize),
            ),
            // Instruction text
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Text(
                'Align QR code within the frame',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.btnPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // Animated scanning line
            AnimatedBuilder(
              animation: _lineAnimation,
              builder: (context, child) {
                return Positioned(
                  top: overlaySize * _lineAnimation.value,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    color: Colors.lightBlueAccent.withOpacity(0.7),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  final double size;
  _ScannerOverlayPainter(this.size);

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final borderPaint = Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final rect = Rect.fromCenter(
      center: Offset(canvasSize.width / 2, canvasSize.height / 2),
      width: size,
      height: size,
    );

    // Draw rounded border
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(16)),
      borderPaint,
    );

    // Draw corner accents
    final cornerPaint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    const double cornerLen = 20;
    // Top-left
    canvas.drawLine(
        rect.topLeft, rect.topLeft + const Offset(cornerLen, 0), cornerPaint);
    canvas.drawLine(
        rect.topLeft, rect.topLeft + const Offset(0, cornerLen), cornerPaint);
    // Top-right
    canvas.drawLine(rect.topRight, rect.topRight + const Offset(-cornerLen, 0),
        cornerPaint);
    canvas.drawLine(
        rect.topRight, rect.topRight + const Offset(0, cornerLen), cornerPaint);
    // Bottom-left
    canvas.drawLine(rect.bottomLeft,
        rect.bottomLeft + const Offset(cornerLen, 0), cornerPaint);
    canvas.drawLine(rect.bottomLeft,
        rect.bottomLeft + const Offset(0, -cornerLen), cornerPaint);
    // Bottom-right
    canvas.drawLine(rect.bottomRight,
        rect.bottomRight + const Offset(-cornerLen, 0), cornerPaint);
    canvas.drawLine(rect.bottomRight,
        rect.bottomRight + const Offset(0, -cornerLen), cornerPaint);

    // Shade outside area
    final overlayPaint = Paint()..color = Colors.black54;
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, canvasSize.width, canvasSize.height))
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(16)))
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(path, overlayPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
