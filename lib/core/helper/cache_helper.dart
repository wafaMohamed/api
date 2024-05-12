import 'package:shared_preferences/shared_preferences.dart';

import '../enums/sharedprefs_key.dart';

class CacheHelper {
  CacheHelper._();

  CacheHelper instance = CacheHelper._();
  SharedPreferences? sharedPreferences;

  Future<void> initSharedPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(SharedPrefsKey key, String value) async {
    await sharedPreferences!.setString(key.name, value);
  }

  Future<void> setInt(SharedPrefsKey key, int value) async {
    await sharedPreferences!.setInt(key.name, value);
  }

  Future<void> setBool(SharedPrefsKey key, bool value) async {
    await sharedPreferences!.setBool(key.name, value);
  }

  Future<void> setDouble(SharedPrefsKey key, double value) async {
    await sharedPreferences!.setDouble(key.name, value);
  }

  Future<void> setStringList(SharedPrefsKey key, List<String> value) async {
    await sharedPreferences!.setStringList(key.name, value);
  }

  Future<String> getString(SharedPrefsKey key) async {
    return sharedPreferences!.getString(key.name) ?? "No Value";
  }

  Future<int> getInt(SharedPrefsKey key) async {
    return sharedPreferences!.getInt(key.name) ?? 0;
  }

  Future<bool> getBool(SharedPrefsKey key) async {
    return sharedPreferences!.getBool(key.name) ?? false;
  }

  Future<double> getDouble(SharedPrefsKey key) async {
    return sharedPreferences!.getDouble(key.name) ?? 0.0;
  }

  Future<List<String>> getStringList(SharedPrefsKey key) async {
    return sharedPreferences!.getStringList(key.name) ?? const ['No value'];
  }

  Future<void> remove(SharedPrefsKey key) async {
    await sharedPreferences!.remove(key.name);
  }

  Future<void> deleteDb() async {
    await sharedPreferences!.clear();
  }
}
