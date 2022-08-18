import 'package:flutter/material.dart';
import 'package:flutter_learning/101/image_learn.dart';
import 'package:flutter_learning/101/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager {
  List<int> selectedItems = [];
  void addSelected(int index) {
    setState(() {
      selectedItems.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: ((context, index) {
        return TextButton(
          onPressed: () async {
            final result = await navigateToWidgetNormal<bool>(
                //kullanacağımız sayfadan alacağımız cevabı böyle alabiliriz.
                context,
                NavigateDetailLearn());
            if (result == true) {
              addSelected(index);
            }
          },
          child: Placeholder(
              color:
                  selectedItems.contains(index) ? Colors.green : Colors.pink),
        );
      })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: () async {},
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true, //çarpı işaretine yarıyor.
        settings: RouteSettings()));
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true, //çarpı işaretine yarıyor.
        settings: RouteSettings()));
  }
}
