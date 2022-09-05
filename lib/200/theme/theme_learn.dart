import 'package:flutter/material.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({Key? key}) : super(key: key);

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            CheckboxListTile(
              value: true,
              onChanged: (val) {},
              title: const Text('select'),
            ),
            SizedBox(
              width: WidgetSizes.circleProfileWidth.value(),
              height: WidgetSizes.normalCardHeight.value(),
            )
          ],
        ));
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidgetSizesExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWidth:
        return 20;
    }
  }
}
