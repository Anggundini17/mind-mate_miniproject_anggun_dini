import 'package:dio/dio.dart';
import '../article.dart';

class ArticleAPI {
  Future<List<Article>> getArticle() async {
    final response = await Dio()
        .get('https://64521cfbbce0b0a0f73ce862.mockapi.io/mindmate/article');

    List<Article> article = (response.data as List)
        .map((e) => Article(
            createdAt: e['createdAt'],
            title: e['title'],
            image: e['image'],
            author: e['author'],
            contentPreview: e['contentPreview'],
            content: e['content'],
            id: e['id']))
        .toList();
    print(article);
    return article;
  }
}
