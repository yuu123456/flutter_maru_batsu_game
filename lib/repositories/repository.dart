// APIを取得するためのメソッドをRepasitoryから呼び出す
import 'package:flutter_maru_batsu_game/service/weather_api_client.dart';

import '../service/location_manager.dart';

class Repository {
  dynamic fetchWeather() async {
    await LocationManager().getCurrantLocation();

    if (LocationManager().locationData == null) {
      print('位置情報が取得されていない');
      return;
    } else {
      double? lat = LocationManager().locationData?.latitude;
      double? lon = LocationManager().locationData?.longitude;
      return WeatherApiClient().fetchWeather(lat, lon);
    }
  }
}
