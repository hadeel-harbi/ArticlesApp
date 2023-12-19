import 'package:articles_app/models/article.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewArticles extends StatelessWidget {
  const ListViewArticles({super.key, required this.list});

  final List<Article> list;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              final url = Uri.parse(list[index].url!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.inAppBrowserView);
              }
            },
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  list[index].media!.first.mediaMetadata!.first.url ??
                      "https://cdn.iconscout.com/icon/free/png-256/free-gallery-187-902099.png",
                  errorBuilder: (context, _, __) {
                    return Image.network(
                        "https://cdn.iconscout.com/icon/free/png-256/free-gallery-187-902099.png");
                  },
                  loadingBuilder: (context, _, __) =>
                      const CircularProgressIndicator(),
                ),
              ),
              title: Text(
                list[index].title ?? "",
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list[index].byline ?? "",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.date_range),
                        Text(list[index].publishedDate ?? "")
                      ],
                    ),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 14,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length);
  }

  Future<void> launchInBrowserView(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    }
  }
}
