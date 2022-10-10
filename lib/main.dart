import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '303/lottie_learn.dart';
import 'product/constant/project_items.dart';
import 'product/global/theme_notifier.dart';
import 'product/init/product_init.dart';
import 'product/navigator/navigator_custom.dart';
import 'package:provider/provider.dart';

import '404/compute/compute_learn.dart';

Future<void> main() async {
  final produtInit = ProductInit();
  await produtInit.init();
  runApp(
    EasyLocalization(
        supportedLocales: produtInit.localizationInit.supportedLocales,
        path: produtInit.localizationInit.localizationPath, // <-- change the path of the translation files
        child: MultiProvider(
          providers: produtInit.providers,
          builder: (context, child) {
            return const MyApp();
          },
        )),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projetcName,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //textScale uygulamadaki verilerin büyüklüğünü kontrol eder.
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child ?? const SizedBox());
      },
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
      home: const ComputeLearnView(), //home verdiğimizde diğer routeları eziyo
    );
  }
}
