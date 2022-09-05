import 'package:flutter/material.dart';
import 'package:flutter_learning/core/random_image.dart';

class ListTileView extends StatelessWidget {
  const ListTileView({Key? key}) : super(key: key);
  final String imagePath = "https://picsum.photos/200/300";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Card(
            child: ListTile(
              title: const RandomImageView(),
              dense: true,
              subtitle: const Text('How do yo do?'),
              leading: const Icon(Icons.money),
              trailing: const SizedBox(
                  width: 20, child: Icon(Icons.chevron_right_sharp)),
              onTap: () {},
            ),
          )
        ]));
  }
}
