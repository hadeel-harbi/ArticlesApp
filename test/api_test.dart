import 'package:articles_app/models/article.dart';
import 'package:articles_app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  test('Get articles', () async {
    final List<Article> articlesList = await ApiService().getArticles();
    expect(articlesList.length, 20);
  });

  test('Get status code', () async {
    final dio = Dio();
    final response = await dio.get(
      'https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json',
      queryParameters: {
        "api-key": "CjoIumfiqzxdTN1dG1rTg5XDzWEch31C",
      },
    );
    expect(response.statusCode, 200);
  });
}
