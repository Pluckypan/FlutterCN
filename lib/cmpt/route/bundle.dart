import 'dart:ffi';

/// 构造类似于 Android 的Bundle
class Bundle {
  Map<String, dynamic> _map = Map();

  _setValue(var k, var v) => _map[k] = v;

  _getValue(var k) {
    if (!_map.containsKey(k)) throw Exception("invalid key.");
    return _map[k];
  }

  putInt(String key, int value) => _setValue(key, value);

  int getInt(String key) => _getValue(key) as int;

  putString(String key, String value) => _setValue(key, value);

  String getString(String key) => _getValue(key) as String;

  putBool(String key, bool value) => _setValue(key, value);

  bool getBool(String key) => _getValue(key) as bool;

  putFloat(String key, Float value) => _setValue(key, value);

  Float getFloat(String key) => _getValue(key) as Float;

  putDouble(String key, double value) => _setValue(key, value);

  double getDouble(String key) => _getValue(key) as double;

  putList(String key, List value) => _setValue(key, value);

  List getList(String key) => _getValue(key) as List;

  putMap(String key, Map value) => _setValue(key, value);

  Map getMap(String key) => _getValue(key) as Map;

  putObject(String key, Object value) => _setValue(key, value);

  getObject(String key) => _getValue(key);

  @override
  String toString() {
    return _map.toString();
  }
}
