import 'package:articles_app/models/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSearchingStateProvider = StateProvider<bool>((ref) {
  return false;
});

final searchArticleProvider =
    NotifierProvider<SearchNotifier, List<Article>?>(() {
  return SearchNotifier();
});

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

      if (result.isEmpty) {
        state = null;
      } else {
        state = result;
      }
    } else {
      state = [];
    }
  }
}
