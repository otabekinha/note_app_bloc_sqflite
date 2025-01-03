import 'package:note_app/src/features/notes/domain/entities/note.dart';
import 'package:note_app/src/features/notes/domain/repository/note_repository.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/get_all_notes_usecase.dart';

class GetAllNotesUseCaseImpl implements GetAllNotesUseCase {
  final NoteRepository repository;

  GetAllNotesUseCaseImpl(this.repository);

  @override
  Future<List<Note>> call() async {
    return await repository.getAllNotes();
  }
}
