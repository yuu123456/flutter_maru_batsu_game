import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_message.freezed.dart';

@freezed
class StatusMessage with _$StatusMessage {
  const factory StatusMessage({
    @Default('ゲーム開始') String message,
    @Default(Colors.black) Color color,
    @Default(24) double fontSize,
    @Default(FontWeight.normal) FontWeight fontWeight,
  }) = _StatusMessage;
}
