import 'package:flutter/material.dart';
import 'package:flutter_learning/200/image_learn_202.dart';
import 'package:kartal/kartal.dart';

class KartalView extends StatefulWidget {
  const KartalView({super.key});

  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  late FocusNode firstFocus;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            child: Text(
              "Kartal",
              style: context.textTheme.headline1,
            ),
            onTap: () {
              context.navigateToPage(const ImageLearn202(), type: SlideType.BOTTOM, extra: context.durationLow);
            },
          ),
          Icon(context.isIOSDevice ? Icons.ios_share : Icons.android_rounded),
          AnimatedContainer(
            duration: context.durationLow,
            height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.15),
            color: Colors.red,
          ),
          const TextField(),
          InkWell(
            child: Text(
              "email",
              style: context.textTheme.headline3,
            ),
            onTap: () {
              'https://github.com/VB10/Flutter-Full-Learn/blob/main/lib/main.dart'.launchWebsite;
            },
          ),
        ],
      ),
    );
  }
}
