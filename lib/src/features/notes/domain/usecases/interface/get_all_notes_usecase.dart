import 'package:note_app/src/features/notes/domain/entities/note.dart';

abstract class GetAllNotesUseCase {
  Future<List<Note>> call();
}