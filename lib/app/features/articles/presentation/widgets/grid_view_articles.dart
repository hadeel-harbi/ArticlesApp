import 'package:articles_app/app/features/articles/domain/article.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GridViewArticles extends StatelessWidget {
  const GridViewArticles({super.key, required this.list});

  final List<Article> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          childAspectRatio: 3 / 4),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            final url = Uri.parse(list[index].url!);
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.inAppBrowserView);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: kElevationToShadow[2]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        list[index].media?.first.mediaMetadata![1].url ??
                            "https://cdn.iconscout.com/icon/free/png-256/free-gallery-187-902099.png",
                        height: 100,
                        errorBuilder: (context, _, __) {
                          return Image.network(
                              "https://cdn.iconscout.com/icon/free/png-256/free-gallery-187-902099.png");
                        },
                      ),
                    ),
                  ),
                  Text(
                    list[index].title ?? "",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    list[index].byline ?? "",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(list[index].publishedDate ?? "")
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
