import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paragfh = "/";
  final items = {
    paragfh: (context) => const LottieLearn(),
    NavigateRoute.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoute.detail.withParaf: (context) => const NavigateHomeDetail(),
  };
}

enum NavigateRoute { init,home, detail }

extension NavigateRouteExtension on NavigateRoute {
  String get withParaf => "/$name";
}
