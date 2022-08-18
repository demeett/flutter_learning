import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../101/image_learn.dart';

class DemosView extends StatelessWidget {
  const DemosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        // appBar: AppBar(
        //   systemOverlayStyle: SystemUiOverlayStyle.light,
        // ),
        body: Padding(
          padding: PaddingItems().horizontalPadding,
          child: Column(
            children: [
              SizedBox(
                  width: 200,
                  height: 300,
                  child: ImageProject(path: ImageItems().appleWithBook)),
              TextWidget(
                titleName: TextNames().textTitle,
                fontStyle: FontWeight.w800,
              ),
              SizedBox(height: 10),
              const SubTitleWidget(
                alignTxt: TextAlign.center,
              ),
              Spacer(),
              ElevetadButtonWidget(),
              TextButtonWidget()
            ],
          ),
        ));
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(TextNames().textButton),
      style: TextButton.styleFrom(primary: ProjectColors().flory),
    );
  }
}

class ElevetadButtonWidget extends StatelessWidget {
  const ElevetadButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: ProjectColors().flory,
          onPrimary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: SizedBox(
          width: 250,
          child: Text(TextNames().buttonName, textAlign: TextAlign.center)),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({Key? key, required this.alignTxt}) : super(key: key);
  final TextAlign alignTxt;
  @override
  Widget build(BuildContext context) {
    return Text(TextNames().textChild,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w200));
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.fontStyle, required this.titleName})
      : super(key: key);
  final FontWeight fontStyle;
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleName,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: fontStyle, color: Colors.black),
    );
  }
}

class PaddingItems {
  final EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);
  final EdgeInsets verticalPadding = const EdgeInsets.symmetric(horizontal: 20);
}

class TextNames {
  final String textTitle = "Create your first note";
  final String textChild = "Add a note " * 7;
  final String buttonName = "On Click";
  final String textButton = "Go to Other Page";
}

class ProjectColors {
  final Color flory = Color.fromARGB(255, 237, 61, 61);
}
