import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  Future<bool> getReadData(String key, SharedPreferences preferences ) async {
    final response = preferences.getString(key);
    if (response?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}
