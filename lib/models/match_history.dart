import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class MatchHistory {
  // データモデルの定義
  final String id = const Uuid().v4();
  final int playCount;
  final String playerXName;
  final String playerOName;
  // bool型が扱えないため、int型で表現する（1:ture)
  final int isPlayerXWin;
  final int isDraw;
  final int isPlaying;

  MatchHistory(
    this.playCount,
    this.playerXName,
    this.playerOName,
    this.isPlayerXWin,
    this.isDraw,
    this.isPlaying,
  );

  // Map型に変換するメソッド
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'playCount': playCount,
      'playerXName': playerXName,
      'playerOName': playerOName,
      'isPlayerXWin': isPlayerXWin,
      'isDraw': isDraw,
      'isPlaying': isPlaying
    };
  }

  //
  static Future<Database> get database async {
    // openDatabase() データベースに接続
    final Future<Database> _database = openDatabase(
        // getDatabasesPath() データベースファイルを保存するパス取得
        join(await getDatabasesPath(), 'match_history_database.db'),
        version: 1, onCreate: ((db, version) {
      return db.execute(
        // テーブルの作成
        '''
        CREATE TABLE matchHistory(
          id TEXT, 
          playCount INTEGER,
          playerXName TEXT, 
          playerOName TEXT, 
          isPlayerXWin INTEGER, 
          isDraw INTEGER,
          isPlaying INTEGER
          )
        ''',
      );
    }));
    return _database;
  }

  // 保存処理
  static Future<void> insertMatchHistory(MatchHistory matchHistory) async {
    final Database db = await database;
    await db.insert(
        // 対象のテーブル名
        'matchHistory',
        // 保存するデータのMap
        matchHistory.toMap(),
        // コンフリクト発生時の挙動
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // 取得処理
  static Future<List<MatchHistory>> getMatchHistorys() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('matchHistory');
    return List.generate(maps.length, (index) {
      return MatchHistory(
        maps[index]['playCount'],
        maps[index]['playerXName'],
        maps[index]['playerOName'],
        maps[index]['isPlayerXWin'],
        maps[index]['isDraw'],
        maps[index]['isPlaying'],
      );
    });
  }

  // 更新処理
  static Future<void> updateMatchHistory(MatchHistory matchHistory) async {
    final db = await database;
    await db.update(
      'matchHistory',
      matchHistory.toMap(),
      where: "id = ?",
      whereArgs: [matchHistory.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  // 削除処理
  static Future<void> deleteMemo(int id) async {
    final db = await database;
    await db.delete(
      'matchHistory',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
