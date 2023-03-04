import '../services/services.dart';

abstract class StorageRepository {
  Future<List<String>> readFavoriteIdsList(String key);
  Future<bool> writeFavoriteIdsList(String key, List<String> value);
}

class StorageRepositoryImpl implements StorageRepository {
  StorageService storage;

  StorageRepositoryImpl() : storage = StorageService();

  @override
  Future<List<String>> readFavoriteIdsList(String key) async {
    return await storage.readStringList(key);
  }

  @override
  Future<bool> writeFavoriteIdsList(String key, List<String> value) async {
    return await storage.writeStringList(key, value);
  }
}
