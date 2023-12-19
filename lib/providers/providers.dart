import 'package:articles_app/models/article.dart';
import 'package:articles_app/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final articlesProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  final period = ref.watch(periodStateProvider);

  List<Article> articles = await ApiService().getArticles(period: period);

  if (GetIt.instance.isRegistered<List<Article>>()) {
    GetIt.instance.unregister<List<Article>>();
  }
  GetIt.instance.registerFactory<List<Article>>(() => articles);

  return articles;
});

final periodStateProvider = StateProvider<int>((ref) {
  return 1;
});

final sortTypeProvider = StateProvider<SortType>(
  (ref) => SortType.list,
);

enum SortType {
  list,
  grid,
}
