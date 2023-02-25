import '../utils/utils.dart';

abstract class StorageRepository {
  Future<List<String>> readList(String key);
  Future<bool> writeList(String key, List<String> value);
}

class StorageRepositoryImpl implements StorageRepository {
  StorageUtils utils = StorageUtils();

  // StorageRepositoryImpl();

  @override
  Future<List<String>> readList(String key) async {
    return await utils.readStringList(key);
  }

  @override
  Future<bool> writeList(String key, List<String> value) async {
    return await utils.writeStringList(key, value);
  }
}
