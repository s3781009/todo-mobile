class Todo {
  late String dateCreated;
  late String text;
  late String userId;
  late String id;
  late bool isCompleted;

  Todo(this.dateCreated, this.text, this.id, this.isCompleted, this.userId);

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    text = json['text'];
    isCompleted = json['completed'];
    dateCreated = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['text'] = text;
    data['completed'] = isCompleted;
    data['datetime'] = dateCreated;
    return data;
  }
}
