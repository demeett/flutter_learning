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
        appBar: AppBar(), body: Column(
          children: [
            ImagePaths.roomdesign.toWidget(height: 200, extensionImage:ExtensionImage.jpg),
            Text('data', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color:Colors.amber ),)
          ],
        ));
  }
}

enum ImagePaths { roomdesign }

extension ImagePathsExtension on ImagePaths {
  String path() {
    return "assets/png/$name.";
  }
  

  Widget toWidget({double height =100 ,required ExtensionImage extensionImage}) {
    return Image.asset(
      extensionImage.toConvert(path()),
      height: height,
    );
  }
 
}

enum ExtensionImage {jpg,png,jpeg}
extension ExtensionImageExtension on ExtensionImage{

  String toConvert(String value)
  {return value+name;}
}



