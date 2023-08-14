import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/models/status_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/game_model.dart';

class GameViewModel extends StateNotifier<GameModel> {
  GameViewModel() : super(GameModel());

  List<List<String>> get board => state.board;
  StatusMessage get statusMessage => state.statusMessage;

  // プレイヤーのマークをボードに配置する
  void makeMove(int row, int col) {
    print('makeMove実行');
    if (state.isPlaying == false) {
      return;
    }
    // マスが空白の場合のみマークを配置する
    if (board[row][col].isEmpty) {
      board[row][col] = state.currentPlayer;
      state.currentPlayer = state.currentPlayer == 'X' ? 'O' : 'X';
    }

    if (checkWinner() != null) {
      if (state.isDraw) {
        state.statusMessage = StatusMessage(
            message: '${checkWinner()!}!!!!!',
            color: Colors.blue,
            fontSize: 60);
      } else {
        state.statusMessage = StatusMessage(
            message: '${checkWinner()!}の勝利！', color: Colors.red, fontSize: 60);
      }
      state.isPlaying = false;
    } else {
      state.statusMessage.message = '${state.currentPlayer}の番です';
    }
    print(state.board);
    print(state.statusMessage.message);
  }

  // ゲームをリセットするメソッド
  void resetGame() {
    state.board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
    state.currentPlayer = 'X';
    state.isDraw = false;
    state.statusMessage = StatusMessage(message: 'リセットしました');
    state.isPlaying = true;
    print(state.board);
    print(state.statusMessage.message);
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
    state.isDraw = true;
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col].isEmpty) {
          state.isDraw = false;
          break;
        }
      }
    }
    if (state.isDraw) {
      return '引き分け';
    }
    // 勝敗がつかない場合
    return null;
  }
}
