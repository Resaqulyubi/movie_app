import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Get the database path
    String path = join(await getDatabasesPath(), 'movie_app.db');
    
    // Open/create the database at a given path
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      // Use FFI for desktop platforms
      return await databaseFactoryFfi.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _onCreate,
        ),
      );
    } else {
      // Use default factory for mobile platforms
      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
      );
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
    
    // Insert a test user
    await db.insert('users', {
      'username': 'test',
      'password': 'test123'
    });
  }

  Future<bool> authenticateUser(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  Future<bool> registerUser(String username, String password) async {
    final db = await database;
    try {
      await db.insert('users', {
        'username': username,
        'password': password,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
