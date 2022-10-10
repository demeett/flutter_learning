import 'shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum SharedKeys{
  counter, users
}
class SharedManager{
  SharedPreferences? preferences;

  SharedManager();
  Future<void> init() async{
    preferences=await SharedPreferences.getInstance();
  }
  void _checkPreferences(){
    if(preferences==null){
      throw SharedNotInitializeException();
    }
  }
  Future<void> saveString(SharedKeys key, String value) async{
        _checkPreferences();
        await preferences?.setString(key.name, value);
  }
  Future<void> saveStringItems(SharedKeys key, List<String> value) async{
        _checkPreferences();
        await preferences?.setStringList(key.name, value);
  }
  List<String>? getStringItems(SharedKeys key) {
        _checkPreferences();
        final counters=preferences?.getStringList(key.name);
       return counters ;
  }
String? getString(SharedKeys key){
   _checkPreferences();
    final String? counter =  preferences?.getString(key.name);
    return counter;
  }
  Future<bool?> removeItem(SharedKeys key)async{
    _checkPreferences();
        return await preferences?.remove(key.name);
  }
}