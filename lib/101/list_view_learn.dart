import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets
              .zero, //listview in default paddingi vardır bunu silmek için zero atarız.
          children: [
            FittedBox(
                child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            )),
            Container(
                color: Colors.red, height: 300, child: const Text('merhbaba')),
            const Divider(),
            SizedBox(
              //listviewin dışına bunu atmadığımız zaman hata alıyoruz.
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      color: Colors.green,
                      width: 300,
                      child: const Text('merhbaba')),
                  Container(
                      color: Colors.white,
                      width: 100,
                      child: const Text('merhbaba')),
                  Container(
                      color: Colors.green,
                      width: 100,
                      child: const Text('merhbaba'))
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.abc),
              onPressed: () {},
            ),
            const _ListDemo()
          ],
        ));
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({Key? key}) : super(key: key);

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('Hello');
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print('Çıktı');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
