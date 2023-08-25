import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/models/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/game_view_model.dart';
import 'menu_drawer.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameViewModelNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定画面'),
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NpcPlayerSwitchTile('先手', gameState.playerX),
            Expanded(
              child: gameState.playerX.isNPC
                  ? const SizedBox()
                  : PlayerNameTextField('先手プレイヤー名', gameState.playerX),
            ),
            NpcPlayerSwitchTile('後手', gameState.playerO),
            Expanded(
              child: gameState.playerO.isNPC
                  ? const SizedBox()
                  : PlayerNameTextField('後手プレイヤー名', gameState.playerO),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class NpcPlayerSwitchTile extends ConsumerWidget {
  final String turn;
  final Player _player;

  const NpcPlayerSwitchTile(this.turn, this._player, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(gameViewModelNotifierProvider.notifier);

    void changeNpcPlayer(newValue) {
      notifier.changeNpcPlayer(_player);
    }

    return SwitchListTile.adaptive(
        title: Text('$turnはNPCですか？'),
        value: _player.isNPC,
        onChanged: changeNpcPlayer);
  }
}

class PlayerNameTextField extends ConsumerWidget {
  final String nameLabel;
  final Player _player;

  const PlayerNameTextField(this.nameLabel, this._player, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(gameViewModelNotifierProvider.notifier);

    String? validateEmpty(String value) {
      if (value.isEmpty) {
        return '未入力です';
      } else {
        return null;
      }
    }

    return TextFormField(
      initialValue: _player.name,
      keyboardType: TextInputType.name,
      maxLines: 1,
      maxLength: 5,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: nameLabel,
        hintText: '名前を入力してください',
        errorText: validateEmpty(_player.name),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 6.0,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 10.0,
          ),
        ),
      ),
      onChanged: (value) {
        notifier.changePlayerName(_player, value);
      },
    );
  }
}
