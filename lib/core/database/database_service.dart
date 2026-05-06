import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/app_constants.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }
}

Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
      CREATE TABLE $recentSearchTableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      query TEXT UNIQUE,
      created_at INTEGER
      )
  ''');

  await db.execute('''
      CREATE TABLE $cachedWordsTableName (
        word TEXT PRIMARY KEY,
        data TEXT
      )
    ''');

  await db.execute('''
      CREATE TABLE $bookmarksTableName (
        word TEXT PRIMARY KEY,
        data TEXT,
        created_at INTEGER
      )
    ''');
}
