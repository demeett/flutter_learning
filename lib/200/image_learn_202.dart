import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: ImagePaths.diningtable.toWidget(height: 50));
  }
}

enum ImagePaths { diningtable }

extension ImagePathsExtension on ImagePaths {
  String path() {
    return "assets/png/$name.png";
  }

  Widget toWidget({double height = 25}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
