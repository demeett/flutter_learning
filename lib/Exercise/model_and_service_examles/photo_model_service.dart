import 'package:flutter/material.dart';
import 'package:flutter_learning/Exercise/model_and_service_examles/model_photo.dart';
import 'package:flutter_learning/Exercise/model_and_service_examles/model_service_complete.dart';

class PhotoModelServiceView extends StatefulWidget {
  const PhotoModelServiceView({Key? key}) : super(key: key);

  @override
  State<PhotoModelServiceView> createState() => _PhotoModelServiceViewState();
}

class _PhotoModelServiceViewState extends State<PhotoModelServiceView> {
  late final IPhotoModelService _photoService;
  List<PhotoModel>? _data;
  @override
  void initState() {
    super.initState();
    _photoService = PhotoModelService();
    getItems();
  }

  Future<void> getItems() async {
    final response = await _photoService.getItemFromService();
    setState(() {
      _data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: ListView.builder(
            itemCount: _data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                      title: Text(_data?[index].title ?? ''),
                      subtitle: Text(_data?[index].url ?? ' ')));
            }));
  }
}
