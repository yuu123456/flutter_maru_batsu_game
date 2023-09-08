import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../views/menu_drawer.dart';
import 'dart:math' as math;

class HooksView extends HookWidget {
  const HooksView({super.key});
  @override
  Widget build(BuildContext context) {
    final yourTurn = useState('ボタンをタップで！');

    useEffect(() {
      debugPrint('画面が表示された');

      return () {
        debugPrint('画面消えた（Drawerでは、呼ばれない）');
      };
    }, const []);

    // 値が変化したらどちらも呼ばれるため、return後は不要？
    useEffect(() {
      debugPrint('countが変化した（retrun前）');
      return () {
        debugPrint('countが変化した（retrun後）');
      };
    }, [yourTurn.value]);

    final text = Text(
      'あなたの手番は・・・${yourTurn.value}',
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
    );

    final button = ElevatedButton(
      onPressed: () {
        var random = math.Random();

        yourTurn.value = random.nextBool() ? '先手' : '後手';
      },
      child: const Text('ジャッジメント！'),
    );

    const sizedBox = SizedBox(width: 20, height: 29);

    return Scaffold(
      appBar: AppBar(
        title: const Text('あなたは先手？後手？'),
      ),
      drawer: const MenuDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [text, sizedBox, button],
        ),
      ),
    );
  }
}
