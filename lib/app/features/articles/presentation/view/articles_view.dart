import 'package:articles_app/app/features/articles/data/article_providers.dart';

import 'package:articles_app/app/features/articles/presentation/widgets/drawer.dart';
import 'package:articles_app/app/features/articles/presentation/widgets/grid_view_articles.dart';
import 'package:articles_app/app/features/articles/presentation/widgets/list_view_articles.dart';
import 'package:articles_app/app/features/articles/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesView extends ConsumerWidget {
  const ArticlesView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesData = ref.watch(getArticlesProvider);
    final sortType = ref.watch(sortTypeProvider);
    final searchResult = ref.watch(searchArticleProvider);
    final isSearching = ref.watch(searchBarStateProvider);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 131, 184, 176),
          title: const Text(
            "NY Times Most Popular",
          ),
          titleTextStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          actions: [
            // search button
            IconButton(
              onPressed: () {
                ref
                    .watch(searchBarStateProvider.notifier)
                    .update((state) => !state);
              },
              icon: const Icon(Icons.search),
            ),
            // menu items
            PopupMenuButton(
              initialValue: sortType,
              onSelected: (item) {
                ref.read(sortTypeProvider.notifier).state = item;
              },
              color: Colors.white,
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: SortType.list,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Text('List'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: SortType.grid,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.grid_view_outlined),
                      Text('Grid'),
                    ],
                  ),
                ),
              ],
            ),
          ],
          // search textfield
          bottom: isSearching
              ? PreferredSize(
                  preferredSize: Size(AppBar().preferredSize.width,
                      AppBar().preferredSize.height + 10),
                  child: const ArticleSearchBar())
              : null,
        ),
        // search textfield
        drawer: DrawerApp(),
        // body
        body: articlesData.when(
          data: (value) {
            return RefreshIndicator(
              onRefresh: () => ref.refresh(getArticlesProvider.future),
              child: searchResult != null
                  ? sortType == SortType.list
                      ? ListViewArticles(
                          list: searchResult.isEmpty ? value : searchResult,
                        )
                      : GridViewArticles(
                          list: searchResult.isEmpty ? value : searchResult)
                  : Container(),
            );
          },
          error: (error, stack) => const Center(
            child: Text("Error"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
