
import 'package:flutter_base_basic_app/services/repositories/models/example_model.dart';
import 'package:flutter_base_basic_app/services/common/crud_repository.dart';
import 'package:flutter_base_basic_app/services/configs/db_config.dart';

class ExampleRepository implements CrudRepository<ExampleModel> {

  @override
  Future<List<ExampleModel>> getAll() async {
    final db = await DBConfig().database;
    final res = await db.query(ExampleModel.tableName);

    return res.isNotEmpty
          ? res.map((m) => ExampleModel.fromMap(m)).toList()
          : [];
  }

  @override
  Future<ExampleModel?> getOne(int id) async {
    final db = await DBConfig().database;
    final res = await db.query(ExampleModel.tableName, where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
          ? ExampleModel.fromMap(res.first)
          : null;
  }

  @override
  Future<int> save(ExampleModel model) async {
    final db = await DBConfig().database;
    return await db.insert(ExampleModel.tableName, model.toMap());
  }

  @override
  Future<void> update(ExampleModel model) async {
    final db = await DBConfig().database;
    await db.update(ExampleModel.tableName, model.toMap(), where: 'id = ?', whereArgs: [ model.id ]);
  }

  @override
  Future<void> delete(int id) async {
    final db = await DBConfig().database;
    await db.delete(ExampleModel.tableName, where: 'id = ?', whereArgs: [id]);
  }

}