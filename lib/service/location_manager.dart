import 'package:location/location.dart';

class LocationManager {
  // シングルトン化する

  // _internal：_instanceの初期化に用いられるコンストラクタ
  LocationManager._internal();
  // _instance：唯一のインスタンスを保持するためのプライベートフィールド
  static final LocationManager _instance = LocationManager._internal();
  // factory：ファクトリコンストラクタ、新たにインスタンスを生成する代わりに_instaceを返す。
  factory LocationManager() => _instance;

  final location = Location();

  LocationData? locationData;

  Future<LocationData?> getCurrantLocation() async {
    if (await checkLocation()) {
      locationData = await location.getLocation();
      return locationData;
    } else {
      return null;
    }
  }

  Future<bool> checkLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionStatus;
    // 位置情報サービスが有効であるか
    serviceEnabled = await location.serviceEnabled();
    // 無効の場合
    if (!serviceEnabled) {
      // リクエストを実行
      serviceEnabled = await location.requestService();
      // それでも無効であればリターン
      if (!serviceEnabled) {
        print('位置情報サービスが無効');
        return false;
      }
    }
    // 位置情報へのアクセス権限があるか
    permissionStatus = await location.hasPermission();
    // ない場合
    if (permissionStatus == PermissionStatus.denied) {
      // リクエストを実行
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        print('位置情報権限が無効');
        return false;
      }
    }
    print('位置情報サービスの有効性OK');
    return true;
  }
}
