import 'dart:convert';

import 'package:flutter_learning/200/cache/shared_learn_cache.dart';
import 'package:flutter_learning/200/cache/shared_manager.dart';
import 'package:flutter_learning/200/cache/user_cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> useritems) async {
    //json encod3e decode işlemlerini compute ile yapmak daha mantıklıdır.
    final _items=useritems.map((element) =>jsonEncode(element.toJson()) ).toList();
    
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }
List<User>? getItems(){
    //json encod3e decode işlemlerini compute ile yapmak daha mantıklıdır.
    final itemsString=sharedManager.getStringItems(SharedKeys.users);
    if (itemsString?.isNotEmpty??false) {
      return itemsString!.map((element) {
        final jsonObject=jsonDecode(element);
        if (jsonObject is Map<String , dynamic>) {
          return User.fromJson(jsonObject);
        }
        return User(name:'name', email:'email', url:'url');
      }).toList();
    }
    return null;
  }

}