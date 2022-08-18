import 'package:flutter/material.dart';

class MyCollectionsDemoView extends StatefulWidget {
  const MyCollectionsDemoView({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemoView> createState() => _MyCollectionsDemoViewState();
}

class _MyCollectionsDemoViewState extends State<MyCollectionsDemoView> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems()._items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomCard(model: _items[index]),
          );
        });
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required CollectionModel model,
  })  : _models = model,
        super(key: key);

  final CollectionModel _models;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 200,
              child: Column(
                children: [
                  Image.asset(
                    _models.imagePath,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 50),
                          child: Expanded(flex: 6, child: Text(_models.title)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Expanded(
                              flex: 4, child: Text(_models.price.toString())),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final int price;
  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late List<CollectionModel> _items;
  CollectionItems() {
    _items = [
      CollectionModel(
          imagePath: ImageUtility().path1, title: 'restorant', price: 500),
      CollectionModel(
          imagePath: ImageUtility().path1, title: 'Rastorant2', price: 500),
      CollectionModel(
          imagePath: ImageUtility().path1, title: 'Rastorant3', price: 600)
    ];
  }
}

class ImageUtility {
  final String path1 = "assets/png/restaurant.png";
}
