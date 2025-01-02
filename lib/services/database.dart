import 'package:note_app/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteDatabaseHelper {
  static final NoteDatabaseHelper _instance = NoteDatabaseHelper._internal();
  static Database? _database;

  NoteDatabaseHelper._internal();

  factory NoteDatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'notes.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(_createNotesTableQuery);
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
          // Handle schema changes here
        },
      );
    } catch (e) {
      throw Exception('Database initialization failed: $e');
    }
  }

  Future<List<NoteModel>> getAllNotes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');

    return List.generate(maps.length, (i) {
      return NoteModel.fromMap(maps[i]);
    });
  }

  Future<void> insertTask(NoteModel note) async {
    final Database db = await database;

    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(NoteModel note) async {
    final Database db = await database;

    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final Database db = await database;

    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // SQL Query Constants
  static const String _createNotesTableQuery = '''
    CREATE TABLE notes(
      id INTEGER PRIMARY KEY,
      title TEXT,
      description TEXT
    )
  ''';
}
