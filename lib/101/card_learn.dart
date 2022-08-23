import 'package:flutter/material.dart';

class CardViewLearn extends StatelessWidget {
  const CardViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const ProjectCard(
                colorName: Colors.amber,
                shapes: StadiumBorder(),
                sizeBox: SizedBox(width: 150, height: 50)),
            const ProjectCard(
                colorName: Colors.purple,
                shapes: CircleBorder(),
                sizeBox: SizedBox(width: 50, height: 50)),
            ProjectCard(
                colorName: Colors.blueAccent,
                shapes: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                sizeBox: const SizedBox(
                    width: 50, height: 50, child: Center(child: Text('name')))),
          ],
        ));
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {Key? key,
      required this.colorName,
      required this.shapes,
      required this.sizeBox})
      : super(key: key);
  final Color colorName;
  final ShapeBorder shapes;
  final SizedBox sizeBox;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          color: colorName,
          margin: ProjectMargin.marginSize,
          shape: shapes, //Kenarlarını yumuşatabiliriz bu sayede
          child: sizeBox),
    );
  }
}

class ProjectMargin {
  static const marginSize = EdgeInsets.all(10);
}
