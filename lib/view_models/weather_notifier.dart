import 'package:flutter_maru_batsu_game/models/weather.dart';
import 'package:flutter_maru_batsu_game/repositories/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_notifier.g.dart';

@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  Repository repository = Repository();

  @override
  Future<WeatherModel> build() async {
    // DartではdynamicからStringやintなどの型へのキャストは自動的に行えるが、FutureからFutureやFutureなどへのキャストはエラーになる。
    // Futureを取得する処理をawaitしてdynamicからの自動キャストとすると正しく処理できる。
    try {
      var data = await repository.fetchWeather();
      return data;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      throw Exception('天気取得エラー');
    }
  }

  void updateState() async {
    print('呼ばれた');
    state = const AsyncValue.loading();
    const sec1 = Duration(seconds: 1);
    await Future.delayed(sec1);

    try {
      var data = await repository.fetchWeather();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      throw Exception('天気取得エラー');
    }
  }
}
