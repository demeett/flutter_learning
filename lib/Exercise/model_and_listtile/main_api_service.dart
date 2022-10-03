import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learning/Exercise/model_and_listtile/photos_model.dart';

abstract class IPhotoApiService {
  Future<List<Photos>?> getPhotoItems();
}

class PhotoApiService implements IPhotoApiService {
  final Dio dio;
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  PhotoApiService() : dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/photos"));
  @override
  Future<List<Photos>?> getPhotoItems() async {
    late final data;
    try {
      final response = await dio.get(ServiceEnum.photos.getPath());
      if (response.statusCode == HttpStatus.ok) {
        data = response.data;
        if (data is List) {
          int counter = 0;

          return data.map((e) {
            
            return Photos.fromJson(e);
          }).toList();
        }
      } else {
        return null;
      }
    } catch (_) {
      if (kDebugMode) {
        print('çıktı yok');
      }
    }
    return null;
  }
}

enum ServiceEnum { photos }

extension ServiceEnumExtension on ServiceEnum {
  String getPath() {
    return "https://jsonplaceholder.typicode.com/$name";
  }
}
