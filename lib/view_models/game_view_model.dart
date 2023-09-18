import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/models/match_history.dart';
import 'package:flutter_maru_batsu_game/models/player.dart';
import 'package:flutter_maru_batsu_game/models/status_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/game_model.dart';

part 'game_view_model.g.dart';

@riverpod
class GameViewModelNotifier extends _$GameViewModelNotifier {
  @override
  GameModel build() {
    return GameModel(
        board: [
          ['', '', ''],
          ['', '', ''],
          ['', '', ''],
        ],
        playerX: Player(isNPC: false, name: 'User'),
        playerO: Player(isNPC: true, name: 'NPC2'));
  }

  List<List<String>> get board => state.board;
  StatusMessage get statusMessage => state.statusMessage;

  // プレイヤーのマークをボードに配置する
  void makeMove(int row, int col) {
    String turnPlayer =
        state.currentPlayer == 'X' ? state.playerX.name : state.playerO.name;
    String nextTurnPlayer =
        state.currentPlayer == 'O' ? state.playerX.name : state.playerO.name;

    if (state.isPlaying == false) {
      return;
    }
    // マスが空白の場合のみマークを配置する
    if (board[row][col].isEmpty) {
      List<List<String>> newBoard = board;
      newBoard[row][col] = state.currentPlayer;
      state = state.copyWith(board: newBoard);
      state =
          state.copyWith(currentPlayer: state.currentPlayer == 'X' ? 'O' : 'X');
      state = state.copyWith(
          statusMessage: StatusMessage(
              message: '$nextTurnPlayer(${state.currentPlayer})の番です'));
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
                message: '$turnPlayerの勝利！', color: Colors.red, fontSize: 60));
      }
      state = state.copyWith(isPlaying: false);
    }
    cpuX();
    cpuO();
  }

  void cpuX() {
    state.currentPlayer == 'X' && state.playerX.isNPC == true
        ? moveCPU()
        : null;
  }

  void cpuO() {
    state.currentPlayer == 'O' && state.playerO.isNPC == true
        ? moveCPU()
        : null;
  }

  // 勝敗の判定
  String? checkWinner() {
    // 横のチェック
    for (int row = 0; row < 3; row++) {
      if (board[row].where((element) => element == board[row][0]).length ==
              board[row].length &&
          board[row][0].isNotEmpty) {
        return board[row][0];
      }
    }

    // 縦のチェック
    for (int col = 0; col < 3; col++) {
      var verticalArray = [];
      for (int i = 0; i < board.length; i++) {
        verticalArray.add(board[i][col]);
      }
      if (verticalArray.where((element) => element == board[0][col]).length ==
              verticalArray.length &&
          board[0][col].isNotEmpty) {
        return board[0][col];
      }
    }
    // 斜めのラインをチェック
    var rightDiagonalArray = [];
    var leftDiagonalArray = [];
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (row == col) {
          leftDiagonalArray.add(board[row][col]);
        }
        if (row + col == board.length - 1) {
          rightDiagonalArray.add(board[row][col]);
        }
      }
    }
    if (leftDiagonalArray.where((element) => element == board[0][0]).length ==
            board.length &&
        board[0][0].isNotEmpty) {
      return board[0][0];
    }
    if (rightDiagonalArray
                .where((element) => element == board[0][board.length - 1])
                .length ==
            board.length &&
        board[0][board.length - 1].isNotEmpty) {
      return board[0][board.length - 1];
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
  Future<void> resetGame() async {
    final matchHistoryList = await MatchHistory.getMatchHistorys();
    final dataCount = matchHistoryList.length;

    MatchHistory matchHis = MatchHistory(
      dataCount + 1,
      state.playerX.name,
      state.playerO.name,
      state.currentPlayer == 'O' ? 1 : 0,
      state.isDraw ? 1 : 0,
      state.isPlaying ? 1 : 0,
    );
    await MatchHistory.insertMatchHistory(matchHis);

    state = state.copyWith(
      board: [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ],
      currentPlayer: 'X',
      isDraw: false,
      isPlaying: true,
      statusMessage: state.playerX.isNPC
          ? const StatusMessage(message: 'NPC思考中・・・')
          : const StatusMessage(message: 'リセットしました'),
    );
    await Future.delayed(const Duration(seconds: 2));
    cpuX();
  }

  // NPCに切り替えるメソッド
  void changeNpcPlayer(Player player) {
    if (player.isNPC) {
      final chagedPlayer = player.copyWith(isNPC: !player.isNPC);
      if (player == state.playerX) {
        state = state.copyWith(playerX: chagedPlayer);
      } else if (player == state.playerO) {
        state = state.copyWith(playerO: chagedPlayer);
      }
    } else {
      if (player == state.playerX) {
        final chagedPlayer =
            player.copyWith(isNPC: !player.isNPC, name: 'NPC1');
        state = state.copyWith(playerX: chagedPlayer);
      } else if (player == state.playerO) {
        final chagedPlayer =
            player.copyWith(isNPC: !player.isNPC, name: 'NPC2');
        state = state.copyWith(playerO: chagedPlayer);
      }
    }

    final chagedPlayer = player.copyWith(isNPC: !player.isNPC);
    if (player == state.playerX) {
      state = state.copyWith(playerX: chagedPlayer);
    } else if (player == state.playerO) {
      state = state.copyWith(playerO: chagedPlayer);
    }
  }

  // プレイヤー名を変更するメソッド
  void changePlayerName(Player player, String changedName) {
    final chagedPlayerName = player.copyWith(name: changedName);
    if (player == state.playerX) {
      state = state.copyWith(playerX: chagedPlayerName);
    } else if (player == state.playerO) {
      state = state.copyWith(playerO: chagedPlayerName);
    }
  }

  int midRow() {
    if (board[0].length % 2 == 0) {
      return board[0].length ~/ 2;
    } else {
      return (board[0].length - 1) ~/ 2;
    }
  }

  int midCol() {
    if (board.length % 2 == 0) {
      return board.length ~/ 2;
    } else {
      return (board.length - 1) ~/ 2;
    }
  }

  void randomMove() {
    if (board[midRow()][midCol()].isEmpty) {
      makeMove(midRow(), midCol());
    } else {
      var randomRow = Random().nextInt(board[0].length);
      var randomCol = Random().nextInt(board.length);
      do {
        randomRow = Random().nextInt(board[0].length);
        randomCol = Random().nextInt(board.length);
      } while (board[randomRow].isEmpty);

      makeMove(randomRow, randomCol);
    }
  }

  // CPUの行動
  void moveCPU() {
    goCPUWin();
  }

  void goCPUWin() {
    int emptyRow;
    int emptyCol;
    int emptyRowCol;

    var player = state.currentPlayer;

    for (int i = 0; i < 2; i++) {
      var verticalArray = [];
      var rightDiagonalArray = [];
      var leftDiagonalArray = [];

      for (int row = 0; row < board.length; row++) {
        for (int col = 0; col < board[row].length; col++) {
          if (row == col) {
            leftDiagonalArray.add(board[row][col]);
          }
          if (row + col == board.length - 1) {
            rightDiagonalArray.add(board[row][col]);
          }

          // 横方向リーチの時、攻める
          if (board[row].where((element) => element == player).length ==
              board[row].length - 1) {
            // 空白のインデックスを取得
            emptyCol = board[row].indexOf('');
            if (emptyCol >= 0) {
              return makeMove(row, emptyCol);
            }
          }
          verticalArray = [];
          // 縦がリーチの時、攻める
          for (int i = 0; i < board.length; i++) {
            verticalArray.add(board[i][col]);
          }
          if (verticalArray.where((element) => element == player).length ==
              verticalArray.length - 1) {
            // 空白のインデックスを取得
            emptyRow = verticalArray.indexOf('');
            print(emptyRow);
            if (emptyRow >= 0) {
              return makeMove(emptyRow, col);
            }
          }
        }
      }
      // 左対角リーチの時、攻める
      if (leftDiagonalArray.where((element) => element == player).length ==
          leftDiagonalArray.length - 1) {
        // 空白のインデックスを取得
        emptyRowCol = leftDiagonalArray.indexOf('');
        print(emptyRowCol);
        if (emptyRowCol >= 0) {
          return makeMove(emptyRowCol, emptyRowCol);
        }
      }
      // 右対角リーチの時、攻める
      if (rightDiagonalArray.where((element) => element == player).length ==
          rightDiagonalArray.length - 1) {
        // 空白のインデックスを取得
        emptyRow = rightDiagonalArray.indexOf('');
        print(emptyRow);
        if (emptyRow >= 0) {
          emptyCol = board.length - 1 - emptyRow;
          return makeMove(emptyRow, emptyCol);
        }
      }
      player = player == 'X' ? 'O' : 'X';
    }

    return randomMove();
  }
}
