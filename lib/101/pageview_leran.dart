import 'package:flutter/material.dart';
import 'package:flutter_learning/101/icon_learn.dart';
import 'package:flutter_learning/101/image_learn.dart';
import 'package:flutter_learning/101/stack_learn.dart';
import 'package:flutter_learning/demos/note_demos.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(
      viewportFraction:
          0.7); //bu olmadan nextpage kısmı çalışmıyor. Tüm sayfayı kaplatmak için de 1 yazarız.
  int _currentPageIndex = 0;
  void updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _currentPageIndex.toString(),
              textAlign: TextAlign.center,
            ),
            FloatingActionButton(
                child: const Icon(Icons.chevron_left),
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.slowMiddle);
                }),
            FloatingActionButton(
                child: const Icon(Icons.chevron_right),
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.slowMiddle);
                }),
          ],
        ),
        body: PageView(
          controller: _pageController, // Dğer sayfa 0.5 lik kadar gözüksün
          onPageChanged: updatePageIndex,
          children: [
            const ImageViewLearn(),
            const DemosView(),
            const IconLearnView(),
            const StackView(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            )
          ],
        ));
  }
}
