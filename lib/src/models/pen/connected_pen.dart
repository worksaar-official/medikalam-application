import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_pen.freezed.dart';
part 'connected_pen.g.dart';

@freezed
class ConnectedPen with _$ConnectedPen {
  const factory ConnectedPen({
    required String macAddress,
    required String deviceName,
    int? batteryLevel,
    DateTime? connectedAt,
  }) = _ConnectedPen;

  factory ConnectedPen.fromJson(Map<String, dynamic> json) =>
      _$ConnectedPenFromJson(json);
}
