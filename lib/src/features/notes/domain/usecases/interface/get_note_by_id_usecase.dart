import 'package:note_app/src/features/notes/domain/entities/note.dart';

abstract class GetNoteByIdUseCase {
  Future<Note> call(String id);
}