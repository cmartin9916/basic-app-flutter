import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:flutter_base_basic_app/services/common/crud_repository.dart';
import 'package:flutter_base_basic_app/services/repositories/example_repository.dart';
import 'package:flutter_base_basic_app/services/repositories/models/example_model.dart';

class ExampleProvider extends ChangeNotifier {

  CrudRepository repository = ExampleRepository();
  List<ExampleModel> records = [];

  Future<void> save(ExampleModel model) async {

    final id = await repository.save(model);

    model.id = id;
    records.add(model);

    listRecords();
  }

  Future<void> update(ExampleModel model) async {

    await repository.update(model);

    listRecords();
  }

  Future<void> delete(int? id) async {
    if(id != null) {
      await repository.delete(id);
      listRecords();
    }
  }

  listRecords() async {
    final records = await repository.getAll();
    this.records = [...records];
    notifyListeners();
  }

}