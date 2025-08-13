// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DPenCtrl {
  static const MethodChannel _channel =
      MethodChannel('com.afpensdk.pen.dpenctrl');

  static const EventChannel eventChannel =
      EventChannel('com.afpensdk.pen.dpenctrl/penMsgStream');

  static const EventChannel eventChannelDot =
      EventChannel('com.afpensdk.pen.dpenctrl/penDotStream');

  static Future<int> btStartForPeripheralsList() async {
    try {
      final int result =
          await _channel.invokeMethod('btStartForPeripheralsList');
      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to start peripherals list: ${e.message}");
      return -1;
    }
  }

  static Future<void> setContext() async {
    try {
      await _channel.invokeMethod('setContext');
    } on PlatformException catch (e) {
      debugPrint("Failed to start peripherals list: ${e.message}");
    }
  }

  static Future<void> setListener() async {
    try {
      await _channel.invokeMethod('setListener');
    } on PlatformException catch (e) {
      debugPrint("${e.message}");
    }
  }

  static Future<void> connect(String addr) async {
    try {
      await _channel.invokeMethod('connect', {'addr': addr});
    } on PlatformException catch (e) {
      debugPrint("${e.message}");
    }
  }

  static Future<void> disconnect() async {
    try {
      await _channel.invokeMethod('disconnect');
    } on PlatformException catch (e) {
      debugPrint("${e.message}");
    }
  }
}
