import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  DateTime createdAt;
  String title;
  String author;
  String image;
  String contentPreview;
  String content;
  String id;

  Article({
    required this.createdAt,
    required this.title,
    required this.image,
    required this.author,
    required this.contentPreview,
    required this.content,
    required this.id,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        image: json["image"],
        author: json["author"],
        contentPreview: json["content_preview"],
        content: json["content"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "image": image,
        "author": author,
        "content_preview": contentPreview,
        "content": content,
        "id": id,
      };
}
