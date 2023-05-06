import 'dart:convert';

import '../article.dart';
import 'package:http/http.dart' as http;

class ArticleApi {
  static const String baseUrl =
      'https://64521cfbbce0b0a0f73ce862.mockapi.io/mindmate/';
  static const String article = '/article';

  static Future<List<Article>> getArticles() async {
    final response = await http.get(Uri.parse('$baseUrl$article'));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<Article> articles =
          body.map((e) => Article.fromJson(e)).toList();
      return articles;
    } else {
      throw "Can't get the data";
    }
  }

  static Future<Article> getArticleById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl$article/$id'));

    if (response.statusCode == 200) {
      final dynamic body = jsonDecode(response.body);
      print("Body: $body");
      final Article article = Article.fromJson(body);
      return article;
    } else {
      throw "Can't get the data";
    }
  }
}
