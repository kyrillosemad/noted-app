class TodoModel {
  String? title;
  String? body;
  String? endtime;
  int? todoId;
  int? ownerId;

  TodoModel({this.title, this.body, this.endtime, this.todoId, this.ownerId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    endtime = json['endtime'];
    todoId = json['todo_id'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['endtime'] = endtime;
    data['todo_id'] = todoId;
    data['owner_id'] = ownerId;
    return data;
  }
}
