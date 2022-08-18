import 'package:flutter/material.dart';

import '../core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                // ignore: prefer_const_literals_to_create_immutables
                alignment: Alignment.center,
                children: const [
                  Positioned.fill(child: RandomImageView(), bottom: 25),
                  Positioned(
                      height: 50,
                      width: 200,
                      bottom: 0,
                      child: Card(
                          color: Colors.white, shape: RoundedRectangleBorder()))
                ],
              )),
          const Spacer(flex: 6)
        ],
      ),
    );
  }
}
