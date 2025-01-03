import 'package:note_app/src/features/notes/domain/entities/note.dart';
import 'package:note_app/src/features/notes/domain/repository/note_repository.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/insert_note_usecase.dart';

class InsertNoteUseCaseImpl implements InsertNoteUseCase {
  final NoteRepository repository;

  InsertNoteUseCaseImpl(this.repository);

  @override
  Future<void> call(Note note) async {
    return await repository.insertNote(note);
  }
}