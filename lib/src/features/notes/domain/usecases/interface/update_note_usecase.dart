import 'package:note_app/src/features/notes/domain/entities/note.dart';

abstract class UpdateNoteUseCase {
  Future<void> call(Note note);
}