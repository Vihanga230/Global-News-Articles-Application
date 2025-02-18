import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  final String apiKey = '3b195016f6e2449787d83bbb5e104538'; 
  final String baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchNews({String? query, String? category}) async {
    final url = Uri.parse(
      '$baseUrl/top-headlines?country=us&apiKey=$apiKey&q=${query ?? ''}&category=${category ?? ''}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final articles = data['articles'] as List;
      return articles.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}