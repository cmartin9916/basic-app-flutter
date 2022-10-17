import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBConfig {
  static DBConfig? _instance;
  static Database ?_database;
  DBConfig._();

  factory DBConfig() =>
      _instance ??= DBConfig._();

  Future<Database> get database async {
    return _database??= await initDB();
  }

  Future<Database> initDB() async{

    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ExampleDB.db' );

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {

        await db.execute('''
          CREATE TABLE ExampleTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title VARCHAR(100) NOT NULL,
            year INTEGER NOT NULL
          )
        ''');
      }
    );
  }
}