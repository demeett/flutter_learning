import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_learning/Exercise/model_and_service_examles/model_photo.dart';

abstract class IPhotoModelService {
  Future<List<PhotoModel>?> getItemFromService();
}

class PhotoModelService extends IPhotoModelService {
  Dio dio = Dio();
  //BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/")

  @override
  Future<List<PhotoModel>?> getItemFromService() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/photos");
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PhotoModel.fromJson(e)).toList();
        } else {
          return null;
        }
      }
    } catch (e) {
      print('hata');
    }
  }
}

enum PhotosName { photos }
