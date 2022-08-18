import 'package:flutter/material.dart';
import 'package:flutter_learning/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.pink;
                  });
                },
                icon: Icon(Icons.clear))
          ],
        ),
        body: Column(children: [
          Spacer(),
          Expanded(
              child: ColorDemos(
            colorInitial: Colors.pink,
          ))
        ]));
  }
}
