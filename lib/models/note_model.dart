class NoteModel {
  final int? id;
  final String title;
  final String description;
  final int completed;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }
}
