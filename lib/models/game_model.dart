// Model：ゲームの状態を保持する
import 'package:flutter_maru_batsu_game/models/status_message.dart';

class GameModel {
  // ボードの状態を保持するリスト
  List<List<String>> board;
  // 現在のプレイヤー（初期値は'×'）
  String currentPlayer;
  // 引き分け判定
  bool isDraw;
  // ゲーム中か勝負がついたか
  bool isPlaying;

  StatusMessage statusMessage;

  GameModel()
      : board = [
          ['', '', ''],
          ['', '', ''],
          ['', '', ''],
        ],
        currentPlayer = 'X',
        isDraw = false,
        statusMessage = StatusMessage(message: 'ゲーム開始'),
        isPlaying = true;
}
