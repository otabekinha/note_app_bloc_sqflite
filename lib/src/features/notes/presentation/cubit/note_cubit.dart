import 'package:bloc/bloc.dart';
import 'package:note_app/src/features/notes/data/data_sources/note_local_data_source.dart';
import 'package:note_app/src/features/notes/data/models/note_model.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteLocalDataSource noteLocalDataSource;

  NoteCubit({required this.noteLocalDataSource}) : super(NoteInitial());

  // Fetch all notes
  Future<void> fetchAllNotes() async {
    try {
      emit(NoteLoading()); // Emit loading state
      final notes = await noteLocalDataSource.getAllNotes();
      emit(NoteLoaded(notes: notes));
    } catch (e) {
      emit(NoteError(message: 'Failed to load notes: $e'));
    }
  }

  // Insert a new note
  Future<void> addNote(NoteModel note) async {
    try {
      await noteLocalDataSource.insertNote(note);
      fetchAllNotes();
    } catch (e) {
      emit(NoteError(message: 'Failed to add note: $e'));
    }
  }

  // Update an existing note
  Future<void> updateNote(NoteModel note) async {
    try {
      await noteLocalDataSource.updateNote(note);
      fetchAllNotes();
    } catch (e) {
      emit(NoteError(message: 'Failed to update note: $e'));
    }
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    try {
      await noteLocalDataSource.deleteNote(id);
      fetchAllNotes();
    } catch (e) {
      emit(NoteError(
          message: 'Failed to delete note: $e')); // Emit error state on failure
    }
  }
}
