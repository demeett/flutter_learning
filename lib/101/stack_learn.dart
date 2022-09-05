import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Container(color: Colors.red, height: 100),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(color: Colors.lightBlue, height: 100),
            ),
            Positioned(
                left: 0, // left ve right konulması gerekiyor.
                right: 0,
                height: 100,
                top: 50,
                child: Container(color: Colors.purple)),
            Positioned.fill(
                left: 0, // left ve right konulması gerekiyor.
                right: 0,
                top: 70,
                child: Container(color: Colors.yellow))
          ],
        ));
  }
}
