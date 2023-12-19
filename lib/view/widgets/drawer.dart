import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  DrawerApp({super.key});

  List periodNumber = [1, 7, 30];
  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      " ${periodNumber[index]} ${periodNumber[index] == 1 ? "day" : "days"} ",
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
