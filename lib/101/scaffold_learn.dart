import 'package:flutter/material.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: const Text('name'),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                //Yukardan aşağı açılan bir kutu olarak düşünebiliriz
                context: context,
                builder:
                    (context) => //Aşağıya button da koyabilirsin , bir container da koyabilirsin .
                        //ElevatedButton(onPressed: () {}, child: const Text('button'))
                        Container(
                          width: 200,
                        ));
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(), // Sol barda listeleme butonudur.
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.ad_units), label: 'a'),
        BottomNavigationBarItem(icon: Icon(Icons.add_call), label: 'b')
      ]),
    );
  }
}
