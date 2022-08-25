import 'package:flutter/material.dart';

import 'launch_manager.dart';
import 'loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin, Birhosum {
  final _url = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            stringUrlLaunch(_url);
          },
        ),
        body: const LoadingBarView());
  }
}

class Birhosum {}
