import 'package:flutter/material.dart';

class RandomImageView extends StatelessWidget {
  const RandomImageView({Key? key, this.height = 100}) : super(key: key);
  final String path = "https://picsum.photos/200/300";
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.network(path, height: height, fit: BoxFit.cover);
  }
}
