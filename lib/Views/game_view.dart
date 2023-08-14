import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            GameStatusView(),
            GameBoardView(),
            SizedBox(height: 20),
            GameResetButton(),
          ],
        ),
      ),
    );
  }
}

class MenuDrawer extends StatelessWidget {
  // Drawerの項目リスト
  static const List<String> drawerItems = ['Game', '説明', '設定', '閉じる'];

  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.builder(
            itemCount: drawerItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(drawerItems[index]),
                onTap: () {
                  // drawerを閉じる
                  Navigator.pop(context);

                  // 項目タップ時の処理
                },
              );
            }));
  }
}

class GameStatusView extends ConsumerWidget {
  const GameStatusView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(gameViewModelPlovider);
    return Text(
      viewModel.statusMessage.message,
      style: TextStyle(
        fontSize: viewModel.statusMessage.fontSize,
        color: viewModel.statusMessage.color,
      ),
    );
  }
}

class GameBoardView extends ConsumerWidget {
  const GameBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(gameViewModelPlovider);
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
                    viewModel.makeMove(row, col);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(80, 80)),
                  child: Text(
                    viewModel.board[row][col],
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
    final viewModel = ref.read(gameViewModelPlovider);

    return ElevatedButton(
        onPressed: () {
          viewModel.resetGame();
        },
        child: const Text("リセット"));
  }
}
