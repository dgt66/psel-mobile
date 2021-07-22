class Todo {
  final int id;
  final int taskId;
  final String title;
  final int checked;
  Todo({this.id, this.taskId, this.title, this.checked});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'title': title,
      'checked': checked,
    };
  }
}