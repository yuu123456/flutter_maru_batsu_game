import 'package:flutter/material.dart';

class StatusMessage {
  String message;
  Color color;
  double fontSize;
  FontWeight fontWeight;

  StatusMessage({
    // required 特定のパラメータを必須（nullを許容しない）にする
    required this.message,
    this.color = Colors.black,
    this.fontSize = 24,
    this.fontWeight = FontWeight.normal,
  });
}
