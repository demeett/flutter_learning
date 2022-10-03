import 'package:flutter/foundation.dart';
import 'package:flutter_learning/303/reqrest_resource/model/resource_model.dart';

class ResourceContext extends ChangeNotifier {
  ResourceModel? model;
  void saveModel(ResourceModel? model) {
    this.model = model;
    notifyListeners();
  }

  void clear() {
    model = null;
    notifyListeners();
  }
}
