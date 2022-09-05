import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learning/200/services/comment_model.dart';
import 'package:flutter_learning/200/services/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel model);
  Future<bool> updateItemToService(PostModel model, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvanced();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio dio;
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  PostService()
      : dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  @override
  Future<bool> addItemToService(PostModel model) async {
    try {
      final response = await dio.post(_PostServicePath.posts.name, data: model);
      return response.statusCode == HttpStatus.created;
    } catch (_) {
      if (kDebugMode) {
        print('hata');
      }
    }
    return false;
  }

  @override
  Future<bool> updateItemToService(PostModel model, int id) async {
    try {
      final response =
          await dio.put('${_PostServicePath.posts.name}/$id', data: model);
      return response.statusCode == HttpStatus.ok;
    } catch (_) {
      if (kDebugMode) {
        print('hata');
      }
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await dio.delete('${_PostServicePath.posts.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } catch (_) {
      if (kDebugMode) {
        print('hata');
      }
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvanced() async {
    try {
      final response = await dio.get(_PostServicePath
          .posts.name); //bu kodu bekle ve bu bitmeden aşağı inme
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        } else {
          return null;
        }
      }
    } catch (_) {
      if (kDebugMode) {
        print('hata var');
      }
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await dio.get(_PostServicePath.comments.name,
          queryParameters: {
            'postId': postId
          }); //bu kodu bekle ve bu bitmeden aşağı inme
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        } else {
          return null;
        }
      }
    } catch (_) {
      if (kDebugMode) {
        print('hata var');
      }
    }
    return null;
  }
}

enum _PostServicePath { posts, comments }
