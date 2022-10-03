import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_learning/303/mobx_image_picker/service/image_upload_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_mobx.g.dart';

class ImageUploadViewModel = _ImageUploadViewModelBase with _$ImageUploadViewModel;

abstract class _ImageUploadViewModelBase with Store {
  @observable
  File? file;
  ImageUploadService imageUploadService = ImageUploadService(
      Dio(BaseOptions(baseUrl: "https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com")));
  @observable
  bool isLoading = false;
  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void init() {}
  @action
  void saveLocalFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  Future<void> saveDataToService() async {
    if (file == null) return;
    await imageUploadService.uploadToImageServer(await file!.readAsBytes(), "dd");
  }
}
