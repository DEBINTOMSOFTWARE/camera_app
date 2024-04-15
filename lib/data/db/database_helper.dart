import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  DatabaseHelper();

  Future<Database> getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'photos.db'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE camera_photos(id TEXT PRIMARY KEY, title TEXT, image TEXT)'),
      version: 1,
    );
    return db;
  }
}
