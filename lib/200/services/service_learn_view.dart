import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/200/services/post_model.dart';
import 'package:flutter_learning/200/services/post_service.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({Key? key}) : super(key: key);

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  @override
  bool isLoading = false;
  late final Dio _newtWorkManager;

  //burası test edilebilir kod sağlar. İnterface
  late final IPostService _postService;

  final String _baseUrl = "https://jsonplaceholder.typicode.com";
  void initState() {
    super.initState();
    _newtWorkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostItemsAdvanced();
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> fetchPostItemsAdvanced() async {
    _changeLoading();
    final response = await _postService.fetchPostItemsAdvanced();
    _changeLoading();
  }

  List<PostModel>? _items;
  Future<void> fetchPostItems() async {
    _changeLoading();
    final response =
        await Dio().get('/posts'); //bu kodu bekle ve bu bitmeden aşağı inme
    print(response);
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
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
      body: _items == null
          ? Placeholder()
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _CardCompanent(items: _items?[index]);
              }),
    );
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
