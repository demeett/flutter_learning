import 'package:json_annotation/json_annotation.dart';
part 'resource_model.g.dart';

String _fecthCustom(String data) {
  return "aa";
}

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  //@JsonKey(fromJson: _fecthCustom) //methodla sarmalaadım aslında

  //final String? pantoneValue;

  Data({this.id, this.name, this.year, this.color});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}
