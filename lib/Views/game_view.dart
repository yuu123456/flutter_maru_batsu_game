import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/Views/weather_view.dart';
import 'package:flutter_maru_batsu_game/view_models/game_view_model.dart';
import 'package:flutter_maru_batsu_game/view_models/weather_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Views/menu_drawer.dart';

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
                  onPressed: () {
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
    return ElevatedButton(
        onPressed: () {
          final notifier = ref.read(gameViewModelNotifierProvider.notifier);
          notifier.resetGame();

          final weatherNotifier = ref.read(weatherNotifierProvider.notifier);
          weatherNotifier.updateState();
        },
        child: const Text("リセット"));
  }
}
