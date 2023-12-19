import 'package:articles_app/models/article.dart';
import 'package:articles_app/services/api_service.dart';
import 'package:articles_app/view/widgets/drawer.dart';
import 'package:articles_app/view/widgets/grid_view_articles.dart';
import 'package:articles_app/view/widgets/list_view_articles.dart';
import 'package:flutter/material.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({
    super.key,
  });

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  String? selectedMenu = "List";
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 131, 184, 176),
        title: const Text("NY Times Most Popular"),
        titleTextStyle: const TextStyle(fontSize: 18, color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: const Icon(Icons.search)),
          PopupMenuButton(
            initialValue: selectedMenu,
            onSelected: (item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "List",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.menu),
                    Text('List'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: "Grid",
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
        bottom: isSearching
            ? PreferredSize(
                preferredSize: Size(AppBar().preferredSize.width,
                    AppBar().preferredSize.height),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 182, 218, 213),
                        hintText: 'Search article ...',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 113, 113, 113)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                ))
            : null,
      ),
      drawer: DrawerApp(),
      body: FutureBuilder(
        future: ApiService().getArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Article> list = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async {},
              child: selectedMenu == "List"
                  ? ListViewArticles(
                      list: list,
                    )
                  : GridViewArticles(
                      list: list,
                    ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
