import 'package:note_app/src/features/notes/domain/repository/note_repository.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/delete_note_usecase.dart';

class DeleteNoteUseCaseImpl implements DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCaseImpl(this.repository);

  @override
  Future<void> call(String id) async {
    return await repository.deleteNote(id);
  }
}
