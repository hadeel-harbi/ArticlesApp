import 'package:articles_app/app/features/articles/domain/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends Notifier<List<Article>?> {
  @override
  List<Article>? build() {
    return [];
  }

  searchArticles(String query, List<Article> data) {
    if (query.isNotEmpty) {
      final result = data
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(query.toString().toLowerCase()))
          .toList();

      if (result.isNotEmpty) {
        state = result;
      } else {
        state = null;
      }
    } else {
      state = [];
    }
  }
}
