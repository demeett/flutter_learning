import 'package:flutter/material.dart';
import 'oop_learn.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({Key? key}) : super(key: key);

  @override
  State<OopLearnView> createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {
  FileDownload? download;
  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircularProgressIndicator(
            color: Colors.red,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        download?.downloadFile(null);
      }),
    );
  }
}
