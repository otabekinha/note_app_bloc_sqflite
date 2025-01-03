import 'package:note_app/src/features/notes/domain/entities/note.dart';

abstract class InsertNoteUseCase {
  Future<void> call(Note note);
}