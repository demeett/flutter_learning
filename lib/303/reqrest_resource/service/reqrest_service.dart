import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_learning/303/reqrest_resource/model/resource_model.dart';

abstract class IReqresService {
  final Dio dio;

  IReqresService(this.dio);
  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqResPath { resource }

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get("/unknown");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data; 
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
