import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> getSharedPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  static Future<bool> saveString(String key, String value) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.setString(key, value);
  }

  static Future<String?> getString1(String key) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.getString(key);
  }

  static Future<bool> saveInt(String key, int value) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.getInt(key);
  }

  static Future<bool> saveDouble(String key, double value) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.setDouble(key, value);
  }

  static Future<double?> getDouble(String key) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.getDouble(key);
  }

  static Future<bool> saveBool(String key, bool value) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.getBool(key);
  }

  static Future<bool> remove(String key) async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.remove(key);
  }

  static Future<bool> clear() async {
    final sharedPreferences = await getSharedPreferences();
    return sharedPreferences.clear();
  }
  static  String? getString(String key) => _preferences!.getString(key);

  static bool contains(String key) {
    return _preferences!.containsKey(key);
  }
}
