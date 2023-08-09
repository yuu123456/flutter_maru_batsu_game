import 'package:flutter/material.dart';
import '../view_models/game_view_model.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  GameViewModel _viewModel = GameViewModel();

  @override
  void initState() {
    super.initState();
    // 一度だけ行いたい処理
    _viewModel = GameViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('まるばつゲーム'),
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GameStatusView(viewModel: _viewModel),
            GameBoardView(viewModel: _viewModel),
            const SizedBox(height: 20),
            GameResetButton(viewModel: _viewModel),
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

class GameStatusView extends StatefulWidget {
  final GameViewModel viewModel;
  const GameStatusView({Key? key, required this.viewModel}) : super(key: key);
  @override
  _GameStatusViewState createState() => _GameStatusViewState();
}

class _GameStatusViewState extends State<GameStatusView> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.viewModel.statusMessage.message,
      style: TextStyle(
        fontSize: widget.viewModel.statusMessage.fontSize,
        color: widget.viewModel.statusMessage.color,
      ),
    );
  }
}

class GameBoardView extends StatefulWidget {
  final GameViewModel viewModel;
  const GameBoardView({Key? key, required this.viewModel}) : super(key: key);
  @override
  _GameBoardViewState createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      widget.viewModel.makeMove(row, col);
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(80, 80)),
                  child: Text(
                    widget.viewModel.board[row][col],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class GameResetButton extends StatefulWidget {
  final GameViewModel viewModel;
  const GameResetButton({Key? key, required this.viewModel}) : super(key: key);
  @override
  _GameResetButtonState createState() => _GameResetButtonState();
}

class _GameResetButtonState extends State<GameResetButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            widget.viewModel.resetGame();
          });
        },
        child: const Text("リセット"));
  }
}
