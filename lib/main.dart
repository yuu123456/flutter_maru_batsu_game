import 'package:flutter/material.dart';
// import 'package:flutter_maru_batsu_game/view_models/game_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/game_view.dart';

// final gameViewModelPlovider = StateProvider((ref) => GameViewModel());

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MaruBatsuGame',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const GameView(),
    );
  }
}
