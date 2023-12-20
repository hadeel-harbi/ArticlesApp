import 'package:articles_app/app/features/articles/data/article_providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerApp extends ConsumerWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List periodNumber = [1, 7, 30];
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          ListTile(
            title: const Text(
              "Time period",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemCount: periodNumber.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ref.read(searchBarStateProvider.notifier).state = false;

                  ref.read(periodStateProvider.notifier).state =
                      periodNumber[index];

                  Navigator.pop(context);
                },
                child: ListTile(
                  title: Text(
                    " ${periodNumber[index]} ${periodNumber[index] == 1 ? "day" : "days"} ",
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
