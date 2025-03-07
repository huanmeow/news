import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_model.dart';
class NewsService {
  static const String apiKey = "43d4a8b93cff4edc871d2f7ef774dd04";
  static const String baseUrl = "https://newsapi.org/v2";

  Future<List<Article>> fetchNews(String category) async {
    final url = "$baseUrl/top-headlines?country=us&category=$category&apiKey=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List articles = data["articles"];
      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
