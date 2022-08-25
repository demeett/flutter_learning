import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/200/services/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  @override
  bool isLoading = false;
  late final Dio _newtWorkManager;
  final String _baseUrl = "https://jsonplaceholder.typicode.com";
  void initState() {
    super.initState();
    _newtWorkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  Future<void> addItemToService(PostModel model) async {
    _changeLoading();
    final response =
        await _newtWorkManager.post(_baseUrl + '/posts', data: model);

    if (response.statusCode == HttpStatus.created) {
      print("başarılı");
    }
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('name'),
          actions: [
            isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
          ],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        body: Column(children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body')),
          TextField(
              controller: _userIdController,
              keyboardType: TextInputType.number, //textinputu number yapıyor.
              inputFormatters: [], //klavyeden sadece sayı girilmesini sağlayan yapı
              decoration: InputDecoration(
                  labelText: 'UserId')), //number türü yapmayı unutma
          TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));
                        addItemToService(model);
                      }
                    },
              child: Text('Send'))
        ]));
  }
}

class _CardCompanent extends StatelessWidget {
  const _CardCompanent({
    Key? key,
    required PostModel? items,
  })  : _items = items,
        super(key: key);

  final PostModel? _items;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(_items?.title ?? ''),
      subtitle: Text(_items?.body ?? ''),
    ));
  }
}
