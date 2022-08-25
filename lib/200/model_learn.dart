import 'package:flutter/material.dart';

class PostModels2 {
  final int _userId; //property isimleri aynı olmalıdır.
  final int _id;
  final String _title;
  final String _body;
  PostModels2(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  //Şu an itibariyle bir sınıf içerisindeki değerleri initialize etmelisiin. Yani doldurmalısıın . 3-4 tane yöntem var .
}

class PostModels {
  late final int userId; //property isimleri aynı olmalıdır.
  late final int id;
  late final String title;
  late final String body;
}

class PostModel2 {
  int? userId; //property isimleri aynı olmalıdır.
  int? id;
  String? title;
  String? body;
}

class PostModel3 {
  final int userId; //property isimleri aynı olmalıdır.
  final int id;
  final String title;
  final String body;
  PostModel3(this.userId, this.id, this.title, this.body);
}

//Local için uygun
class PostModel4 {
  final int userId; //property isimleri aynı olmalıdır.
  final int id;
  final String title;
  final String body;
  PostModel4(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}

//Local için uygun
class PostModel5 {
  late final int _userId; //property isimleri aynı olmalıdır.
  late final int _id;
  late final String _title;
  late final String _body;
  PostModel5(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

class PostModel6 {
  late final int _userId; //property isimleri aynı olmalıdır.
  late final int _id;
  late final String _title;
  late final String _body;
  PostModel6({int userId = 0, int id = 0, String title = "", String body = ""})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

//EĞER DATA SERVİSTEN  GELİYORSA EN DOĞRU MODEL YAZIMI:
class PostModel7 {
  final int? userId; //property isimleri aynı olmalıdır.
  final int? id;
  final String? title;
  final String? body;
  PostModel7({this.userId, this.id, this.title, this.body});
  PostModel7 copyWith({int? userId, int? id, String? title, String? body}) {
    return PostModel7(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body);
  }
}
