import 'package:note_app/src/features/notes/domain/entities/note.dart';
import 'package:note_app/src/features/notes/domain/repository/note_repository.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/update_note_usecase.dart';

class UpdateNoteUseCaseImpl implements UpdateNoteUseCase {
  final NoteRepository repository;

  UpdateNoteUseCaseImpl(this.repository);

  @override
  Future<void> call(Note note) async {
    return await repository.updateNote(note);
  }
}