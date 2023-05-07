import 'package:flutter/cupertino.dart';
import 'package:mind_mate_app/models/api/api_article.dart';
import '../models/api/api_article_http.dart';

import '../models/article.dart';

enum ArticleViewState {
  empty,
  loading,
  loaded,
  error,
}

class MyArticleData with ChangeNotifier {
  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Article? _singleArticle;
  Article? get singleArticle => _singleArticle;

  ArticleViewState _requestState = ArticleViewState.empty;
  ArticleViewState get requestState => _requestState;

  String _message = '';
  String get message => _message;

  Future<void> getArticleList() async {
    _requestState = ArticleViewState.loading;
    notifyListeners();
    try {
      final result = await ArticleApi.getArticles();
      _articles = result;
      _requestState = ArticleViewState.loaded;
      notifyListeners();
      print('Data Artikel : ${_articles.length}');
    } catch (e) {
      _requestState = ArticleViewState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<void> fetchDetailArticleById(int id) async {
    print('Call');
    _requestState = ArticleViewState.loading;
    notifyListeners();
    try {
      final result = await ArticleApi.getArticleById(id);
      _singleArticle = result;
      print('Result: $result');
      _requestState = ArticleViewState.loaded;
      notifyListeners();
    } catch (e) {
      _requestState = ArticleViewState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
