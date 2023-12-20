import 'package:articles_app/app/features/articles/domain/article.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class ArticlesRepository {
  Future<List<Article>> fetchArticles({int period = 1}) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/$period.json',
        queryParameters: {
          "api-key": dotenv.env['API_KEY'],
        },
      );
      List<Article> articles = [];
      for (var element in response.data["results"]) {
        articles.add(Article.fromJson(element));
      }

      //Dependency Injection
      articlesDI(articles);

      return articles;
    } catch (error) {
      throw const FormatException("Error");
    }
  }

  articlesDI(List<Article> articles) {
    if (GetIt.instance.isRegistered<List<Article>>()) {
      GetIt.instance.unregister<List<Article>>();
    }
    GetIt.instance.registerSingleton<List<Article>>(articles);
  }
}
