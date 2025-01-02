class NoteModel {
  final int? id;
  final String title;
  final String description;
  final DateTime createdDate;

  NoteModel({
    this.id,
    required this.title,
    required this.description,
    required this.createdDate,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      createdDate: DateTime.parse(map['createdDate']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'createdDate': createdDate.toIso8601String(),
    };
  }
}
