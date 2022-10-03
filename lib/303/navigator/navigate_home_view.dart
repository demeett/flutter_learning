import 'package:flutter/material.dart';
import 'package:flutter_learning/product/mixin/navigator_mixin.dart';
import 'package:flutter_learning/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          router.pushToPage(NavigateRoute.detail, arguments: "abc");
          //Navigator.of(context).pushNamed(NavigateRoute.detail.withParaf(), arguments: "abc");
          //NavigatorManager.instance.pushToPage(NavigateRoute.detail, arguments: "abc");
        },
        child: const Icon(Icons.rocket),
      ),
      appBar: AppBar(title: Text(toString())),
    );
  }
}
