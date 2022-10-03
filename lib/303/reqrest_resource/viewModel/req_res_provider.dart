import 'package:flutter/material.dart';
import 'package:flutter_learning/product/global/resource_context.dart';

import '../model/resource_model.dart';
import '../service/reqrest_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resource = [];
  bool isLoading = false;
  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resource = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }

  bool? saveToLocale(ResourceContext resourceContext, List<Data>? resources) {
    resourceContext.saveModel(ResourceModel(data: resource));
    return resourceContext.model?.data?.isNotEmpty;
  }
}
