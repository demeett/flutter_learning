import 'package:flutter/material.dart';
import 'package:flutter_learning/303/lottie_learn.dart';
import 'package:flutter_learning/303/mobx_image_picker/view/mobx_image_upload.dart';
import 'package:flutter_learning/product/constant/project_items.dart';
import 'package:flutter_learning/product/global/resource_context.dart';
import 'package:flutter_learning/product/global/theme_notifier.dart';
import 'package:flutter_learning/product/navigator/navigator_custom.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ResourceContext>(create: (context) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) {
        return ThemeNotifier();
      })
    ],
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projetcName,
      theme: context.watch<ThemeNotifier>().currentTheme,
      // ThemeData.dark().copyWith(
      //     tabBarTheme: const TabBarTheme(labelColor: Colors.white, unselectedLabelColor: Colors.red),
      //     bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      //     progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
      //     inputDecorationTheme: const InputDecorationTheme(
      //         filled: true,
      //         fillColor: Colors.white,
      //         iconColor: Colors.red,
      //         border: OutlineInputBorder(),
      //         labelStyle: TextStyle(color: Colors.red)),
      //     textTheme:
      //         const TextTheme(subtitle1: TextStyle(color: Colors.red)), //form alanlarındaki yazı rengine etki edebilir.
      //     listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //     appBarTheme: const AppBarTheme(
      //         centerTitle: true, //ortada başlamasını sağlar . Önemli bir detaydır.
      //         backgroundColor: Colors.transparent,
      //         elevation: 0, //background sıfırlamaya yarıyor.
      //         systemOverlayStyle:
      //             SystemUiOverlayStyle.light // programın dışında kalan saat , wifi gibi alanları light yapıyor.
      //         )),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const LottieLearn();
          },
        );
      },
      //onGenerateRoute: onGenerateRoute,
      //routes: NavigatorRoutes().items,
      //navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      debugShowCheckedModeBanner: false, //projeden otomatik gelen appbar yapısını kaldırır.
      home: const MobxImageUpload(), //home verdiğimizde diğer routeları eziyo
    );
  }
}
