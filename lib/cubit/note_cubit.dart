import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/services/database.dart';

class NoteCubit extends Cubit<List<NoteModel>> {
  final NoteDatabaseHelper databaseHelper;

  NoteCubit({required this.databaseHelper}) : super([]);

  Future<void> loadNotes() async {
    try {
      final notes = await databaseHelper.getAllNotes();
      emit(notes);
    } catch (e) {
      emit([]); // Emit an empty state on error
    }
  }

  Future<void> addNote(NoteModel note) async {
    try {
      await databaseHelper.insertTask(note);
      await loadNotes();
    } catch (e) {
      // Handle errors (e.g., show an error message)
    }
  }

  Future<void> updateNote(NoteModel note) async {
    try {
      await databaseHelper.updateTask(note);
      await loadNotes();
    } catch (e) {
      // Handle errors
    }
  }

  Future<void> deleteNoteById(int id) async {
    try {
      await databaseHelper.deleteTask(id);
      await loadNotes();
    } catch (e) {
      // Handle errors
    }
  }
}
