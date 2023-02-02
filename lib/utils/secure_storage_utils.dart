import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _authTokenKey = '_auth_token_key';

const storage = FlutterSecureStorage();

Future<String?> read(String key) async {
  return await storage.read(key: key);
}

Future<Map<String, String>> readAll() async {
  return await storage.readAll();
}

Future<void> delete(String key) async {
  await storage.delete(key: key);
}

Future<void> deleteAll() async {
  await storage.deleteAll();
}

Future<void> write(String key, String value) async {
  await storage.write(key: key, value: value);
}

/// Use this method to securely save auth token
Future<void> writeAuthToken(String value) async {
  await write(_authTokenKey, value);
}

Future<String?> readAuthToken() async {
  return await read(_authTokenKey);
}
