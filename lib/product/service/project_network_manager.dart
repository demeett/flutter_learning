import 'package:dio/dio.dart';

class ProjectNetworkManger {
  late final Dio _dio;
  ProjectNetworkManger._() {
    _dio = Dio(BaseOptions(baseUrl: ('pub.dev')));
  }
  static final instance = ProjectNetworkManger._();
  Dio get service => _dio;

  void addBadeToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": token});
  }

  String get val => name();

  String name({String? name}) {
    return name ?? "";
  }
}

class DurationManager {
  DurationManager._();
  static DurationManager? _manager;
  static DurationManager get manager {
    if (manager != null) {
      return _manager!;
    }
    _manager = DurationManager._();
    return _manager!;
  }
}
