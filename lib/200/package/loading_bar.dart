import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBarView extends StatefulWidget {
  const LoadingBarView({Key? key}) : super(key: key);

  @override
  State<LoadingBarView> createState() => _LoadingBarViewState();
}

class _LoadingBarViewState extends State<LoadingBarView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("a", style: Theme.of(context).textTheme.subtitle1),
          SpinKitSquareCircle(
            color: Colors.white,
            size: 50.0,
            controller: AnimationController(
                vsync: this, duration: const Duration(milliseconds: 1200)),
          ),
        ],
      ),
    );
  }
}
