// Dart imports:
import 'dart:async';
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:injectable/injectable.dart';

@lazySingleton
class ImageService {
  ui.Image? _cachedImage;

  Future<void> preloadImage(String assetPath) async {
    if (_cachedImage == null) {
      final ByteData imageData = await rootBundle.load(assetPath);
      final Uint8List bytes = imageData.buffer.asUint8List();

      final Completer<ui.Image> completer = Completer();
      ui.decodeImageFromList(bytes, (ui.Image img) {
        _cachedImage = img;
        completer.complete(img);
      });

      await completer.future;
    }
  }

  ui.Image? get cachedImage => _cachedImage;
}
