import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'news_model.dart';

class FavoritesProvider with ChangeNotifier {
  List<Article> _favorites = [];

  List<Article> get favorites => _favorites;

  void toggleFavorite(Article article) async {
    if (_favorites.contains(article)) {
      _favorites.remove(article);
    } else {
      _favorites.add(article);
    }
    notifyListeners();
    await saveFavorites();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(_favorites.map((e) => e.toJson()).toList());
    await prefs.setString('favorites', encodedData);
  }

}
