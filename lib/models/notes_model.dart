class NoteModel {
  String? title;
  String? body;
  int? noteId;
  int? ownerId;

  NoteModel({this.title, this.body, this.noteId, this.ownerId});

  NoteModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    noteId = json['note_id'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['note_id'] = noteId;
    data['owner_id'] = ownerId;
    return data;
  }
}
