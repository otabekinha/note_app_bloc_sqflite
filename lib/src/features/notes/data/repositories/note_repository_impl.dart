import 'package:note_app/src/features/notes/data/data_sources/note_local_data_source.dart';
import 'package:note_app/src/features/notes/data/models/note_model.dart';
import 'package:note_app/src/features/notes/domain/entities/note.dart';
import 'package:note_app/src/features/notes/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  // Constructor to inject the data source
  NoteRepositoryImpl({required this.noteLocalDataSource});

  @override
  Future<List<Note>> getAllNotes() async {
    try {
      // Fetch the list of notes from local data source
      final List<NoteModel> noteModels = await noteLocalDataSource.getAllNotes();
      // Convert NoteModel to Note (domain model)
      return noteModels.map((noteModel) => Note(
        id: noteModel.id,
        title: noteModel.title,
        description: noteModel.description,
      )).toList();
    } catch (e) {
      throw Exception('Failed to fetch all notes: $e');
    }
  }

  @override
  Future<Note> getNoteById(String id) async {
    try {
      final NoteModel? noteModel = await noteLocalDataSource.getNoteById(id);
      if (noteModel != null) {
        return Note(
          id: noteModel.id,
          title: noteModel.title,
          description: noteModel.description,
        );
      } else {
        throw Exception('Note not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch note by ID: $e');
    }
  }

  @override
  Future<void> insertNote(Note note) async {
    try {
      // Convert domain model Note to NoteModel (data model)
      final noteModel = NoteModel(
        id: note.id,
        title: note.title,
        description: note.description,
      );
      await noteLocalDataSource.insertNote(noteModel);
    } catch (e) {
      throw Exception('Failed to insert note: $e');
    }
  }

  @override
  Future<void> updateNote(Note note) async {
    try {
      // Convert domain model Note to NoteModel (data model)
      final noteModel = NoteModel(
        id: note.id,
        title: note.title,
        description: note.description,
      );
      await noteLocalDataSource.updateNote(noteModel);
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      await noteLocalDataSource.deleteNote(id);
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }
}
