import 'package:note_app/src/features/notes/domain/entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getAllNotes();
  Future<Note> getNoteById(String id);
  Future<void> insertNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String id);
}
