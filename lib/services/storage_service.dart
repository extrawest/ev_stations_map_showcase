// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  SharedPreferences? _prefs;

  Future<SharedPreferences> getPrefs() async {
    return _prefs = await SharedPreferences.getInstance();
  }

  Future<List<String>> readStringList(String key) async {
    await getPrefs();
    final result = _prefs?.getStringList(key) ?? [];
    return result;
  }

  Future<bool> writeStringList(String key, List<String> value) async {
    await getPrefs();
    final result = await _prefs?.setStringList(key, value) ?? false;
    return result;
  }
}
