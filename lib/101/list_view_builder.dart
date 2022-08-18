import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        //separated ile sayfa sayıımzı verebiliriz. Data çekip çizme işlemlerinde kullanırız.
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 15, //sayfa sayısını veririz bunula
        itemBuilder: (context, index) {
          print('dcd');
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                //Placeholder(color: Colors.red),
                Expanded(child: Image.network('https://picsum.photos/200')),
                Text('$index')
              ],
            ),
          );
        },
      ),
    );
  }
}
