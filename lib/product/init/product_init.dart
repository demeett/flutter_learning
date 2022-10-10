import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learning/product/global/resource_context.dart';
import 'package:flutter_learning/product/init/localization_init.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../global/theme_notifier.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ResourceContext>(create: (context) => ResourceContext()),
    ChangeNotifierProvider<ThemeNotifier>(create: (context) {
      return ThemeNotifier();
    })
  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
