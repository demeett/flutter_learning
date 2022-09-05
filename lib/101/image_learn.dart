import 'package:flutter/material.dart';

class ImageViewLearn extends StatelessWidget {
  const ImageViewLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: ImageProject(path: ImageItems().appleWithBook),
              ),
            )
          ],
        ));
  }
}

class ImageItems {
  final String appleWithBook =
      "assets/png/apple-and-book-png-apple-on-books-svg-scrapbook-cut-file-cute-clipart-files-for-silhouette-cricut-pazzles-free-svgs-free-svg-cuts-cute-cut-files-432.png";
}

class ImageProject extends StatelessWidget {
  const ImageProject({Key? key, required this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(path, fit: BoxFit.contain);
  }
}
