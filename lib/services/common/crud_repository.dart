abstract class CrudRepository<T> {

  Future<List<T>> getAll();
  Future<T?> getOne(int id);
  Future<int> save(T book);
  Future<void> update(T book);
  Future<void> delete(int id);

}