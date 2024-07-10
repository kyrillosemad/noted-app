class LinkModel {
  String? title;
  String? body;
  String? link;
  int? linkId;
  int? ownerId;

  LinkModel({this.title, this.body, this.link, this.linkId, this.ownerId});

  LinkModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    link = json['link'];
    linkId = json['link_id'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['link'] = link;
    data['link_id'] = linkId;
    data['owner_id'] = ownerId;
    return data;
  }
}
