import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_maru_batsu_game/models/weather.dart';

class WeatherApiClient {
  // シングルトン化する

  // _internal：_instanceの初期化に用いられるコンストラクタ
  WeatherApiClient._internal();
  // _instance：唯一のインスタンスを保持するためのプライベートフィールド
  static final WeatherApiClient _instance = WeatherApiClient._internal();
  // factory：ファクトリコンストラクタ、新たにインスタンスを生成する代わりに_instaceを返す。
  factory WeatherApiClient() => _instance;

  // .envから取得する
  final appid = dotenv.env['API_KEY'];
  final units = 'metric';
  final lang = 'ja';
  final cnt = '8';

  Future<WeatherModel?> fetchWeather(double? lat, double? lon) async {
    final dio = Dio();
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appid&units=$units&lang=$lang';
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      try {
        var weatherModel = WeatherModel.fromJson(response.data);
        return weatherModel;
      } catch (error) {
        print('デコードエラー：$error');
        rethrow;
      }
    }
    print('NULL');
    return null;
  }
}
