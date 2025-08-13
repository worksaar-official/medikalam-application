// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pen_event.freezed.dart';
part 'pen_event.g.dart';

@freezed
class PenEvent with _$PenEvent {
  const factory PenEvent({
    @JsonKey(name: 'STRING_PEN_MAC_ADDRESS') required String macAddress,
    @JsonKey(name: 'STRING_DEVICE_NAME') required String deviceName,
    @JsonKey(name: 'STRING_DEVICE_RSSI') required int rssi,
    @JsonKey(name: 'STRING_DEVICE_ADVDATA')  dynamic advData,
    required int penMsgType,
  }) = _PenEvent;

  factory PenEvent.fromJson(Map<String, dynamic> json) =>
      _$PenEventFromJson(json);
}
