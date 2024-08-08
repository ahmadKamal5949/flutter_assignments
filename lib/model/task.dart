class Task {
  final int? id;
  final String description;
  final bool isCompleted;

  Task({this.id, required this.description, required this.isCompleted});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}
