import 'package:note_app/src/features/notes/domain/entities/note.dart';
import 'package:note_app/src/features/notes/domain/repository/note_repository.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/get_note_by_id_usecase.dart';

class GetNoteByIdUseCaseImpl implements GetNoteByIdUseCase {
  final NoteRepository repository;

  GetNoteByIdUseCaseImpl(this.repository);

  @override
  Future<Note> call(String id) async {
    return await repository.getNoteById(id);
  }
}
