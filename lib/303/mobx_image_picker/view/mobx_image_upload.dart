import 'package:flutter/material.dart';
import 'package:flutter_learning/303/mobx_image_picker/viewModel/image_upload_view_mobx.dart';
import 'package:flutter_learning/product/utility/image_upload.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final _imageUpload = ImageUploadViewModel();
  final imageUploadPath = "https://assets4.lottiefiles.com/packages/lf20_urbk83vw.json";
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload"),
        actions: [
          Observer(builder: (_) {
            return _imageUpload.isLoading ? const CircularProgressIndicator() : const SizedBox();
          })
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Card(
            elevation: 10,
            child: FittedBox(
                child: IconButton(
              icon: Lottie.network(imageUploadPath),
              onPressed: () async {
                _imageUpload.saveLocalFile(await _imageUploadManager.fetchFromLibrary());
              },
            )),
          ),
        ),
        const Divider(),
        Expanded(
            flex: 4,
            child: Observer(
              builder: (context) {
                return _imageUpload.file != null ? Image.file(_imageUpload.file!) : const SizedBox();
              },
            ))
      ]),
    );
  }
}
