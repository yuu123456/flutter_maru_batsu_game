import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/view_models/weather_notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherNotifierProvider);
    double screenHight = MediaQuery.of(context).size.height;

    String makeURL(String iconId) =>
        'https://openweathermap.org/img/wn/$iconId@2x.png';

    // AsyncValueの時は、各状態を定義可能
    final locationWidget = state.when(
      data: (d) => Text(
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          '${d.name}の天気：'),
      error: (e, s) => Text('エラー$e'), //eがエラー、sがエラーの場所
      loading: () => const CircularProgressIndicator(),
    );

    final tempWidget = state.when(
      data: (d) => Text(
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          '現在の気温：${d.main?.temp}℃'),
      error: (e, s) => Text('エラー$e'), //eがエラー、sがエラーの場所
      loading: () => const CircularProgressIndicator(),
    );

    final humifityWidget = state.when(
      data: (d) => Text(
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          '湿度：${d.main?.humidity}％'),
      error: (e, s) => Text('エラー$e'), //eがエラー、sがエラーの場所
      loading: () => const CircularProgressIndicator(),
    );

    final iconWidget = state.when(
      data: (d) {
        final url = makeURL(d.weather!.first.icon!);
        return Image.network(
          url,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return SizedBox(
                width: 80,
                height: 80,
                child: child,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        );
      },
      error: (e, s) => const Icon(Icons.error),
      loading: () => const CircularProgressIndicator(),
    );

    return Container(
      width: double.infinity,
      height: screenHight / 5,
      color: Colors.green,
      alignment: Alignment.topCenter,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                locationWidget,
                iconWidget,
              ],
            ),
            tempWidget,
            humifityWidget,
          ],
        ),
      ),
    );
  }
}
