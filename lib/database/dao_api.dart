abstract class DaoApi<T> {
  Future<T> get(String key);

  Future<List<T>> getAll();

  Future<void> save(T model);

  Future<void> update(T model);

  Future<void> delete(T model);

  Future<void> clearStore();
}
