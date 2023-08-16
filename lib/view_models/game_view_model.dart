import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/models/status_message.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/game_model.dart';

part 'game_view_model.g.dart';

@riverpod
class GameViewModelNotifier extends _$GameViewModelNotifier {
  @override
  GameModel build() {
    return GameModel();
  }

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
      print(board);
      List<List<String>> newBoard = board;
      newBoard[row][col] = state.currentPlayer;
      state = state.copyWith(board: newBoard);
      state =
          state.copyWith(currentPlayer: state.currentPlayer == 'X' ? 'O' : 'X');
    }

    if (checkWinner() != null) {
      if (state.isDraw) {
        state = state.copyWith(
            statusMessage: StatusMessage(
                message: '${checkWinner()!}!!!!!',
                color: Colors.blue,
                fontSize: 60));
      } else {
        state = state.copyWith(
            statusMessage: StatusMessage(
                message: '${checkWinner()!}の勝利！',
                color: Colors.red,
                fontSize: 60));
      }
      state = state.copyWith(isPlaying: false);
    } else {
      state = state.copyWith(
          statusMessage: StatusMessage(message: '${state.currentPlayer}の番です'));
    }
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
    state = state.copyWith(isDraw: true);
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col].isEmpty) {
          state = state.copyWith(isDraw: false);
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

  // ゲームをリセットするメソッド
  void resetGame() {
    state = state.copyWith(
      board: [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ],
      currentPlayer: 'X',
      isDraw: false,
      isPlaying: true,
      statusMessage: StatusMessage(message: 'リセットしました'),
    );

    print(state.board);
    print(state.statusMessage.message);
  }
}
