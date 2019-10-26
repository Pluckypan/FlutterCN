import 'package:shared_preferences/shared_preferences.dart';

class MMKV {
  MMKV._();

  static Future<bool> setValue(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value.runtimeType == bool) {
      return prefs.setBool(key, value as bool);
    }

    if (value.runtimeType == int) {
      return prefs.setInt(key, value as int);
    }

    if (value.runtimeType == String) {
      return prefs.setString(key, value as String);
    }

    if (value.runtimeType == List) {
      return prefs.setStringList(key, value as List<String>);
    }
    return prefs.setString(key, value.toString());
  }

  static Future<T> getValue<T>(String key) async {
    print("T=$T key=$key");
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key) as T;
  }
}
