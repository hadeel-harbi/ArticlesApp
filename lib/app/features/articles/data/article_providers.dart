import 'package:articles_app/app/features/articles/data/article_repository.dart';
import 'package:articles_app/app/features/articles/data/search_notifier.dart';
import 'package:articles_app/app/features/articles/domain/article.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_providers.g.dart';

@riverpod
Future<List<Article>> getArticles(GetArticlesRef ref) {
  final period = ref.watch(periodStateProvider);
  return ArticlesRepository().fetchArticles(period: period);
}

final periodStateProvider = StateProvider<int>((ref) {
  return 1;
});

final searchArticleProvider =
    NotifierProvider<SearchNotifier, List<Article>?>(() {
  return SearchNotifier();
});

final searchBarStateProvider = StateProvider<bool>((ref) {
  return false;
});

final sortTypeProvider = StateProvider<SortType>(
  (ref) => SortType.list,
);

enum SortType { list, grid }
