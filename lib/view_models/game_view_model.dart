import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/models/status_message.dart';

import '../models/game_model.dart';

class GameViewModel {
  final GameModel _model = GameModel();
  // getter 読み取りのみ、書き込みは、別途_model.プロパティ名に代入する
  List<List<String>> get board => _model.board;
  StatusMessage get statusMessage => _model.statusMessage;

  // プレイヤーのマークをボードに配置する
  void makeMove(int row, int col) {
    print('makeMove実行');
    if (_model.isPlaying == false) {
      return;
    }
    // マスが空白の場合のみマークを配置する
    if (board[row][col].isEmpty) {
      board[row][col] = _model.currentPlayer;
      _model.currentPlayer = _model.currentPlayer == 'X' ? 'O' : 'X';
    }

    if (checkWinner() != null) {
      if (_model.isDraw) {
        _model.statusMessage = StatusMessage(
            message: '${checkWinner()!}!!!!!',
            color: Colors.blue,
            fontSize: 60);
      } else {
        _model.statusMessage = StatusMessage(
            message: '${checkWinner()!}の勝利！', color: Colors.red, fontSize: 60);
      }
      _model.isPlaying = false;
    } else {
      statusMessage.message = '${_model.currentPlayer}の番です';
    }
    print(_model.board);
    print(_model.statusMessage.message);
  }

  // ゲームをリセットするメソッド
  void resetGame() {
    _model.board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
    _model.currentPlayer = 'X';
    _model.isDraw = false;
    _model.statusMessage = StatusMessage(message: 'リセットしました');
    _model.isPlaying = true;
    print(_model.board);
    print(_model.statusMessage.message);
  }

  // 勝敗の判定
  String? checkWinner() {
    // 横のチェック
    for (int row = 0; row < 3; row++) {
      if (board[row][0] == board[row][1] &&
          board[row][1] == board[row][2] &&
          board[row][0].isNotEmpty) {
        return board[row][0];
      }
    }
    // 縦のチェック
    for (int col = 0; col < 3; col++) {
      if (board[0][col] == board[1][col] &&
          board[1][col] == board[2][col] &&
          board[0][col].isNotEmpty) {
        return board[0][col];
      }
    }
    // 斜めのラインをチェック
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0].isNotEmpty) {
      return board[0][0];
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2].isNotEmpty) {
      return board[0][2];
    }
    // 引き分け
    _model.isDraw = true;
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col].isEmpty) {
          _model.isDraw = false;
          break;
        }
      }
    }
    if (_model.isDraw) {
      return '引き分け';
    }
    // 勝敗がつかない場合
    return null;
  }
}
