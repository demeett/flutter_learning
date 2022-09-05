import 'package:flutter/material.dart';

class IndicatorViewLearn extends StatelessWidget {
  const IndicatorViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularIndicatorWidget(),
        ));
  }
}

class CircularIndicatorWidget extends StatelessWidget {
  const CircularIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
        //color: Colors.red,
        );
  }
}
