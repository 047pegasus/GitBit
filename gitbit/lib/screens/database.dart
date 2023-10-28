import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gitbit/screens/model.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> open() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'user_data.db');

    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE user_data(id INTEGER PRIMARY KEY, username TEXT, userInformation TEXT)',
      );
    });
  }

  Future<void> insertUserData(UserData userData) async {
    await _database.insert(
      'user_data',
      userData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<UserData?> getUserData(String username) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'user_data',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (maps.isEmpty) {
      return null;
    }

    return UserData.fromMap(maps.first);
  }
}
