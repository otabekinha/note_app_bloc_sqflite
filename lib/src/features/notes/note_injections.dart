import 'package:get_it/get_it.dart';
import 'package:note_app/src/features/notes/data/data_sources/note_local_data_source.dart';
import 'package:note_app/src/features/notes/data/repositories/note_repository_impl.dart';
import 'package:note_app/src/features/notes/domain/repository/note_repository.dart';
import 'package:note_app/src/features/notes/domain/usecases/implementation/delete_note_usecase_impl.dart';
import 'package:note_app/src/features/notes/domain/usecases/implementation/get_all_notes_usecase_impl.dart';
import 'package:note_app/src/features/notes/domain/usecases/implementation/get_note_by_id_usecase_impl.dart';
import 'package:note_app/src/features/notes/domain/usecases/implementation/insert_note_usecase_impl.dart';
import 'package:note_app/src/features/notes/domain/usecases/implementation/update_note_usecase_impl.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/delete_note_usecase.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/get_all_notes_usecase.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/get_note_by_id_usecase.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/insert_note_usecase.dart';
import 'package:note_app/src/features/notes/domain/usecases/interface/update_note_usecase.dart';

final getIt = GetIt.instance;

void initNoteModule() {
  // Data Sources
  getIt.registerLazySingleton<NoteLocalDataSource>(() => NoteLocalDataSource());

  // Repositories
  getIt.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(noteLocalDataSource: getIt()));

  // Use Cases
  getIt.registerLazySingleton<GetAllNotesUseCase>(
    () => GetAllNotesUseCaseImpl(getIt())
  );
  
  getIt.registerLazySingleton<GetNoteByIdUseCase>(
    () => GetNoteByIdUseCaseImpl(getIt())
  );
  
  getIt.registerLazySingleton<InsertNoteUseCase>(
    () => InsertNoteUseCaseImpl(getIt())
  );
  
  getIt.registerLazySingleton<UpdateNoteUseCase>(
    () => UpdateNoteUseCaseImpl(getIt())
  );
  
  getIt.registerLazySingleton<DeleteNoteUseCase>(
    () => DeleteNoteUseCaseImpl(getIt())
  );
}
