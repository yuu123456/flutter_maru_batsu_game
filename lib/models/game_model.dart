// Model：ゲームの状態を保持する
import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/models/player.dart';
import 'package:flutter_maru_batsu_game/models/status_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  factory GameModel({
    required List<List<String>> board,
    @Default('X') String currentPlayer,
    @Default(false) bool isDraw,
    @Default(true) bool isPlaying,
    @Default(StatusMessage(
      message: 'ゲーム開始',
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ))
    StatusMessage statusMessage,
    required Player playerX,
    required Player playerO,
  }) = _GameModel;
}
