import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  bool isLoading = false;
  late final Dio _newtWorkManager;
  final String _baseUrl = "https://jsonplaceholder.typicode.com";
  @override
  void initState() {
    super.initState();
    _newtWorkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  Future<void> addItemToService(PostModel model) async {
    _changeLoading();
    final response =
        await _newtWorkManager.post('$_baseUrl/posts', data: model);

    if (response.statusCode == HttpStatus.created) {
      if (kDebugMode) {
        print("başarılı");
      }
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
          title: const Text('name'),
          actions: [
            isLoading
                ? const CircularProgressIndicator.adaptive()
                : const SizedBox.shrink()
          ],
        ),
        // ignore: prefer_const_literals_to_create_immutables
        body: Column(children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body')),
          TextField(
              controller: _userIdController,
              keyboardType: TextInputType.number, //textinputu number yapıyor.
              inputFormatters: const [], //klavyeden sadece sayı girilmesini sağlayan yapı
              decoration: const InputDecoration(
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
              child: const Text('Send'))
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
