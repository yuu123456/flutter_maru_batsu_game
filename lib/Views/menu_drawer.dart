import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/Views/game_view.dart';
import 'package:flutter_maru_batsu_game/Views/hooks_view.dart';
import 'package:flutter_maru_batsu_game/Views/match_history_view.dart';

import 'setting_view.dart';

class MenuDrawer extends StatelessWidget {
  // Drawerの項目リスト
  static const List<String> drawerItems = ['Game', '説明', '設定', '閉じる'];

  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('メニュー'),
        ),
        ListTile(
          title: const Text('ゲーム'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GameView()));
          },
        ),
        ListTile(
          title: const Text('設定'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingView()));
          },
        ),
        ListTile(
          title: const Text('対戦履歴'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MatchHistoryView()));
          },
        ),
        ListTile(
          title: const Text('Hooks'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HooksView()));
          },
        ),
        ListTile(
          title: const Text('閉じる'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
