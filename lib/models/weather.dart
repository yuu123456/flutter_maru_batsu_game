import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel({
    int? dt,
    String? name,
    Main? main,
    List<Weather>? weather,
  }) = _WeatherModel;
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Main with _$Main {
  factory Main({
    double? temp,
    int? humidity,
  }) = _Main;
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Weather with _$Weather {
  factory Weather({
    String? icon,
  }) = _Weather;
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
