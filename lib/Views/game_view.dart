import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/Views/weather_view.dart';
import 'package:flutter_maru_batsu_game/view_models/game_view_model.dart';
import 'package:flutter_maru_batsu_game/view_models/weather_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Views/menu_drawer.dart';
import 'admob_view.dart';
import 'dart:math' as math;

class GameView extends ConsumerWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('まるばつゲーム'),
      ),
      drawer: const MenuDrawer(),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),
            Expanded(
              child: FittedBox(
                child: GameStatusView(),
              ),
            ),
            GameBoardView(),
            SizedBox(height: 20),
            GameResetButton(),
            Spacer(),
            AdmobView(),
            WeatherView(),
          ],
        ),
      ),
    );
  }
}

class GameStatusView extends ConsumerWidget {
  const GameStatusView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameViewModelNotifierProvider);
    return Text(
      gameState.statusMessage.message,
      style: TextStyle(
        fontSize: gameState.statusMessage.fontSize,
        color: gameState.statusMessage.color,
      ),
    );
  }
}

class GameBoardView extends ConsumerWidget {
  const GameBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameViewModelNotifierProvider);
    bool isTurnPlayerNPC = gameState.currentPlayer == 'X'
        ? gameState.playerX.isNPC
        : gameState.playerO.isNPC;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 3*3のグリッドビューを作成
        for (int row = 0; row < 3; row++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int col = 0; col < 3; col++)
                ElevatedButton(
                  onPressed: isTurnPlayerNPC
                      ? null
                      : () {
                          final notifier =
                              ref.read(gameViewModelNotifierProvider.notifier);
                          notifier.makeMove(row, col);
                        },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(80, 80)),
                  child: Text(
                    gameState.board[row][col],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class GameResetButton extends ConsumerWidget {
  const GameResetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameViewModelNotifierProvider);

    return ElevatedButton(
        onPressed: () {
          final notifier = ref.read(gameViewModelNotifierProvider.notifier);
          notifier.resetGame();

          final weatherNotifier = ref.read(weatherNotifierProvider.notifier);
          var random = math.Random();
          random.nextInt(10) > 8 ? weatherNotifier.updateState() : null;
        },
        child:
            gameState.isPlaying ? const Text("リセット") : const Text('保存＆リセット'));
  }
}
