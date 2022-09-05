import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learning/Exercise/model_and_service_examles/model_photo.dart';

abstract class IPhotoModelService {
  Future<List<PhotoModel>?> getItemFromService();
}

// ! Backend hazırlanana kadar fake datalarla çalışmak için kullanılan sınıf.
// class MockPhotoModelService extends IPhotoModelService {
//   @override
//   Future<List<PhotoModel>?> getItemFromService() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return [
//       PhotoModel(
//         albumId: 'sadsa'
//       ),
//     ];
//   }
// }

class PhotoModelService extends IPhotoModelService {
  Dio dio = Dio();
  //BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/")

  @override
  Future<List<PhotoModel>?> getItemFromService() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/photos");
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PhotoModel.fromJson(e)).toList();
        } else {
          return null;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('hata');
      }
    }
    return null;
  }
}

enum PhotosName { photos }
