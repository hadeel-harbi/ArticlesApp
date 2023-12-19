import 'package:articles_app/models/article.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<List<Article>> getArticles({int period = 1}) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/$period.json',
        queryParameters: {
          "api-key": "CjoIumfiqzxdTN1dG1rTg5XDzWEch31C",
        },
      );

      final List<Article> articles = [];

      for (var element in response.data["results"]) {
        articles.add(Article.fromJson(element));
      }
      return articles;
    } catch (error) {
      throw const FormatException("Error");
    }
  }
}
