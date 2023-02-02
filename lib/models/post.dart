class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json['userId'] == null ? null : json['userId'] as int?,
        id: json['id'] == null ? null : json['id'] as int?,
        title: json['title'] == null ? null : json['title'] as String?,
        body: json['body'] == null ? null : json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
