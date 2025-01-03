import 'package:note_app/src/features/notes/data/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteLocalDataSource {
  static final NoteLocalDataSource _instance = NoteLocalDataSource._internal();
  static Database? _database;

  NoteLocalDataSource._internal();
  factory NoteLocalDataSource() => _instance;

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

  Future<void> insertNote(NoteModel note) async {
    try {
      final Database db = await database;
      await db.insert(
        'notes',
        note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Failed to insert note: $e');
    }
  }

  Future<void> updateNote(NoteModel note) async {
    try {
      final Database db = await database;
      await db.update(
        'notes',
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
      );
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      final Database db = await database;
      await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  Future<NoteModel?> getNoteById(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return NoteModel.fromMap(maps.first);
    } else {
      return null; // If no note found
    }
  }

  static const String _createNotesTableQuery = '''
    CREATE TABLE notes(
      id TEXT PRIMARY KEY,
      title TEXT,
      description TEXT
    )
  ''';
}
