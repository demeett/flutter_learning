import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CompleteDesign(
              width: _width,
              path1: ImagePaths().roomDesign,
              path2: ImagePaths().diningTableDesign,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 100, bottom: 70),
                child: Text("Living Room"),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 70),
                child: Text("Dining Room"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Expanded(
              child: CompleteDesign(
                width: _width,
                path1: ImagePaths().bedRoomDesign,
                path2: ImagePaths().coffeTableDesign,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text("Bed Room"),
              ),
              const Padding(
                padding: EdgeInsets.only(),
                child: Text("Coffee Table"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CompleteDesign extends StatelessWidget {
  const CompleteDesign({
    Key? key,
    required this.path1,
    required this.path2,
    required double width,
  })  : _width = width,
        super(key: key);
  final String path1;
  final String path2;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: _width / 2.5,
            height: _width / 2.5,
            child: CardDesign(imagePath: path1),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: _width / 2.5,
            height: _width / 2.5,
            child: CardDesign(imagePath: path2),
          ),
        )
      ],
    );
  }
}

class CardDesign extends StatelessWidget {
  const CardDesign({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class ImagePaths {
  final String roomDesign = "assets/png/roomdesign.jpg";
  final String diningTableDesign = "assets/png/diningtable.jpg";
  final String bedRoomDesign = "assets/png/bedroom.jpg";
  final String coffeTableDesign = "assets/png/coffetable.jpg";
}
