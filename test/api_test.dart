import 'package:articles_app/app/features/articles/data/article_repository.dart';
import 'package:articles_app/app/features/articles/domain/article.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test/test.dart';

void main() {
  test('Get articles', () async {
    final List<Article> articlesList =
        await ArticlesRepository().fetchArticles();
    expect(articlesList.length, 20);
  });

  test('Get status code', () async {
    final dio = Dio();
    final response = await dio.get(
      'https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json',
      queryParameters: {
        "api-key": dotenv.env['API_KEY'],
      },
    );
    expect(response.statusCode, 200);
  });
}
