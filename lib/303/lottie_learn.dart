import 'package:flutter/material.dart';
import 'package:flutter_learning/product/constant/duration_items.dart';
import 'package:flutter_learning/product/constant/lottie_items.dart';
import 'package:flutter_learning/product/global/theme_notifier.dart';
import 'package:flutter_learning/product/navigator/navigator_manager.dart';
import 'package:flutter_learning/product/navigator/navigator_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../product/service/project_network_manager.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

//https://assets6.lottiefiles.com/packages/lf20_ydo1amjm.json
class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
    navigatoToHome();
  }

  Future<void> navigatoToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    //Navigator.of(context).pushNamed(NavigateRoute.home.withParaf());
    //Navigator.of(context).pushReplacementNamed(NavigateRoute.home.withParaf()); Geri gelme butonu olmayan yönlendirme
    NavigatorManager.instance.pushToPage(NavigateRoute.home);
  }

  @override
  Widget build(BuildContext context) {
    late final deg = ProjectNetworkManger.instance;
    late final deg2 = ProjectNetworkManger.instance;

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                controller.animateTo(isLight ? 0.5 : 1); //Animasyonun hareketini kontrol ediyo
                context.read<ThemeNotifier>().changeTheme();
                isLight = !isLight;
              },
              child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false, controller: controller))
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network("https://assets8.lottiefiles.com/packages/lf20_x7Qnzj.json"));
  }
}
