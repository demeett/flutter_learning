import 'package:flutter/material.dart';
import 'package:flutter_learning/101/image_learn.dart';
import 'package:flutter_learning/Exercise/homeCard.dart';
//Projelerde tabbar bi tane olur onu da main dartta yazarız

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController
      _tabController; //eğer sayfaya yönlendirme yapmak istiyorsak

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _MyTabViews.values.length,
        vsync:
            this); //vsync hata vermesin diye  TickerProviderStateMixin ekliyoruz.
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length, //enumdaki sayıyı alıyor.
        child: Scaffold(
          extendBody:
              true, //butonu içe gömmede yardımcı oluyor. Gölgeyi kaldırıyor.
          bottomNavigationBar: _bottomAppBar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(0); //0. sayfaya git diyor.
          }),
          appBar: AppBar(
              //     bottom: TabBar(controller: _tabController, tabs: const [
              //   //burası sayfayı üstten değiştirir. bir sayfadan diğerine geçişi sağlar.
              //   Tab(
              //     text: 'Page1',
              //   ),
              //   Tab(
              //     text: 'Page 2',
              //   )
              // ])
              ),
          body: _tabBarView(),
        ));
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
        notchMargin: 10, //bunu mainde yazmak daha doğru
        shape:
            const CircularNotchedRectangle(), //floatingactionı içe gölgeli gömüyor. //bunu mainde yazmak daha doğru
        //sayfalama yapısını aşağıya kuruyor.
        child: TabBar(
          //isScrollable: true, //sıkıştırmayı yan yana getirmeyi sağlar
          onTap: (int value) {},
          controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: _MyTabViews.values
              .map((e) => Tab(
                    text: e.name,
                  ))
              .toList(),
        ));
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), //sayfalar arasındaki geçişi yana sürüükleyerek yapmayı kapatır
        controller: _tabController,
        children: [
          //burada tab bar aşağıda sayfa geçişlerini sağlayacak yeri söylüyor.
          //Yukarıdaki length uzunluğu ile buradaki children lenght aynı olmalı
          HomeCard(),
          Container(
            color: Colors.green,
          ),
          ImageViewLearn(),
          Container(color: Colors.amber)
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
