import 'dart:typed_data';

import 'package:dio/dio.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);
  //https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com
  Future<void> uploadToImageServer(Uint8List byteArray, String name) async {
    var formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(byteArray),
    });
    dio.post('full%2F$name.png', data: formData, onSendProgress: (count, total) {
      
    },);
  }
}
