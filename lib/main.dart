import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/101/text_learn.dart';

import '101/app_bar.dart';
import '101/button_learn.dart';
import '101/card_learn.dart';
import '101/container_sized_box.dart';
import '101/icon_learn.dart';
import '101/image_learn.dart';
import '101/padding_learn.dart';
import '101/scaffold_learn.dart';
import '101/statless_learn.dart';

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
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
              centerTitle:
                  true, //ortada başlamasını sağlar . Önemli bir detaydır.
              backgroundColor: Color.fromARGB(255, 94, 93, 93),
              elevation: 0, //background sıfırlamaya yarıyor.
              systemOverlayStyle: SystemUiOverlayStyle
                  .light // programın dışında kalan saat , wifi gibi alanları light yapıyor.
              )),
      debugShowCheckedModeBanner:
          false, //projeden otomatik gelen appbar yapısını kaldırır.
      home: ImageViewLearn(),
    );
  }
}
