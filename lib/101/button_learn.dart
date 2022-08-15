import 'package:flutter/material.dart';

class ButtonViewLearn extends StatelessWidget {
  const ButtonViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red;
                }
                return Colors.amber;
              })),
              child: const Icon(Icons.add)),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shadowColor: Colors.red),
              child: const Text('Save')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
          OutlinedButton(
            onPressed: () {
              //Servise istek at.
              //Sayfanın rengini düzenle.
            }, //buttonun boyutunu belirledik.
            style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
            child: const SizedBox(width: 500, child: Text("data")),
          ),
          InkWell(
            onTap: () {},
            child: const Text('custom'), //paddingsiz textbutton
          ),
          Container(
            width: 100,
            color: Colors.white,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
