import 'package:flutter/material.dart';
import 'package:flutter_learning/200/image_learn_202.dart';
import 'package:flutter_learning/303/lottie_learn.dart';
import 'package:flutter_learning/303/navigator/navigate_home_detail_view.dart';

import '../../303/navigator/navigate_home_view.dart';
import '../../main.dart';
import 'navigator_routes.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const ImageLearn202());
    }

    final routes = routeSettings.name == NavigatorRoutes.paragfh
        ? NavigateRoute.init
        : NavigateRoute.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigateRoute.init:
        return _navigateToNormal(const LottieLearn());
      case NavigateRoute.home:
        return _navigateToNormal(const NavigateHomeView());
      case NavigateRoute.detail:
        final id = routeSettings.arguments;
        return _navigateToNormal(
            NavigateHomeDetail(
              id: id is String ? id : null,
            ),
            isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
        fullscreenDialog: isFullScreenDialog ?? false,
        builder: (context) {
          return child;
        });
  }
}
