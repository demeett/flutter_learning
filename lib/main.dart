import 'package:flutter/material.dart';
import 'package:flutter_learning/101/text_learn.dart';

import '101/container_sized_box.dart';
import '101/scaffold_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      debugShowCheckedModeBanner:
          false, //projeden otomatik gelen appbar yapısını kaldırır.
      home: ScaffoldLearnView(),
    );
  }
}
