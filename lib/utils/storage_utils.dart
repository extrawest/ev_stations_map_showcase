// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  SharedPreferences? _prefs;

  Future<SharedPreferences> getPrefs() async {
    return _prefs = await SharedPreferences.getInstance();
  }

  Future<List<String>> readStringList(String key) async {
    final result = _prefs?.getStringList(key) ?? [];
    return result;
  }

  Future<bool> writeStringList(String key, List<String> value) async {
    final result = await _prefs?.setStringList(key, value) ?? false;
    return result;
  }

  // Future<String?> read(String key) async {
  //   return await storage.read(key: key);
  // }

  // Future<Map<String, String>> readAll() async {
  //   return await storage.readAll();
  // }

  // Future<void> delete(String key) async {
  //   await storage.delete(key: key);
  // }

  // Future<void> deleteAll() async {
  //   await storage.deleteAll();
  // }

  // Future<void> write(String key, String value) async {
  //   await storage.write(key: key, value: value);
  // }

  // /// Use this method to securely save auth token
  // Future<void> writeAuthToken(String value) async {
  //   await write(_authTokenKey, value);
  // }

  // Future<String?> readAuthToken() async {
  //   return await read(_authTokenKey);
  // }
}
