import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '200/sheet_learn.dart';

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
          tabBarTheme: const TabBarTheme(labelColor: Colors.white, unselectedLabelColor: Colors.red),
          bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              iconColor: Colors.red,
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.red)),
          textTheme:
              const TextTheme(subtitle1: TextStyle(color: Colors.red)), //form alanlarındaki yazı rengine etki edebilir.
          listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
          appBarTheme: const AppBarTheme(
              centerTitle: true, //ortada başlamasını sağlar . Önemli bir detaydır.
              backgroundColor: Colors.transparent,
              elevation: 0, //background sıfırlamaya yarıyor.
              systemOverlayStyle:
                  SystemUiOverlayStyle.light // programın dışında kalan saat , wifi gibi alanları light yapıyor.
              )),
      debugShowCheckedModeBanner: false, //projeden otomatik gelen appbar yapısını kaldırır.
      home: const SheetLearn(),
    );
  }
}
