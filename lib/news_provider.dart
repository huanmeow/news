import 'package:flutter/material.dart';
import 'news_model.dart';
import 'news_service.dart';
class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await NewsService().fetchNews(category);
    } catch (e) {
      print("Error fetching news: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
