class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
