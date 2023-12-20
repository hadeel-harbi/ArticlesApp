import 'package:articles_app/app/features/articles/data/article_providers.dart';
import 'package:articles_app/app/features/articles/domain/article.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ArticleSearchBar extends ConsumerWidget {
  const ArticleSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Article> articles = GetIt.instance.get<List<Article>>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            ref
                .read(searchArticleProvider.notifier)
                .searchArticles(value, articles);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 182, 218, 213),
            hintText: 'Search article ...',
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 113, 113, 113)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
