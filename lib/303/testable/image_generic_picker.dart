import 'package:flutter/material.dart';
import 'package:flutter_learning/product/utility/image_upload_manager.dart';

import '../../product/utility/image_upload.dart';

class ImagePickerGenericView extends StatefulWidget {
  const ImagePickerGenericView({super.key});

  @override
  State<ImagePickerGenericView> createState() => _ImagePickerGenericViewState();
}

class _ImagePickerGenericViewState extends State<ImagePickerGenericView> {
  final _imageUpdload = ImageUploadManager();
  late final ImageUploadCustomManager _imageUploadCustomManager;
  late final ImageUploadCustomManager _cameraImageUpload;
  @override
  void initState() {
    super.initState();
    _imageUploadCustomManager = ImageUploadCustomManager(LibraryImageUpload());
    _cameraImageUpload = ImageUploadCustomManager(CameraImageUpload());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                //_imageUpdload.fetchFromLibrary();
                _imageUploadCustomManager.cropWithFetch();
              },
              child: const Text("fetch from galery")),
          ElevatedButton(
              onPressed: () {
                _cameraImageUpload.cropWithFetch();
              },
              child: const Text("fetch from library")),
          ElevatedButton(onPressed: () {}, child: const Text("fetch from normal"))
        ],
      ),
    );
  }
}
