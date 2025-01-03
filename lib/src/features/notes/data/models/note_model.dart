import 'package:note_app/src/features/notes/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    required super.id,
    required super.title,
    required super.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'].toString(),
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  // Convert NoteModel to Note (for your domain layer)
  Note toEntity() {
    return Note(
      id: id,
      title: title,
      description: description,
    );
  }

  // And similarly, create NoteModel from Note (for your data layer)
  factory NoteModel.fromEntity(Note note) {
    return NoteModel(
      id: note.id,
      title: note.title,
      description: note.description,
    );
  }
}
