import 'package:note_app/src/features/notes/data/models/note_model.dart';
import 'package:meta/meta.dart';
 
@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<NoteModel> notes;

  NoteLoaded({required this.notes});
}

class NoteError extends NoteState {
  final String message;

  NoteError({required this.message});
}
