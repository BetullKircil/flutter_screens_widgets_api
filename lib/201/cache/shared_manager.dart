import 'package:flutter_deneme_somestr/201/cache/shared_not_initialized.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;
  SharedManager() {
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) throw SharedInitializedException();
  }

  Future<void> SaveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString('counter', value);
  }

  Future<void> SaveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await preferences?.setStringList('counter', value);
  }

  String? GetString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(SharedKeys.counter.name);
  }

  List<String>? GetStringList(SharedKeys key) {
    _checkPreferences();
    return preferences?.getStringList(SharedKeys.counter.name);
  }

  Future<bool> Remove(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}
