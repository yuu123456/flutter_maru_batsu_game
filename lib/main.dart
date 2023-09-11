import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_maru_batsu_game/models/match_history.dart';
// import 'package:flutter_maru_batsu_game/view_models/game_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'views/game_view.dart';

// final gameViewModelPlovider = StateProvider((ref) => GameViewModel());

Future<void> main() async {
  // Flutterバインディングの初期化
  WidgetsFlutterBinding.ensureInitialized();

  //envの読み込み設定
  await dotenv.load(fileName: '.env');

  // AdmobのSDK初期化
  MobileAds.instance.initialize();

  await MatchHistory.database;

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
      debugShowCheckedModeBanner: false,
    );
  }
}
