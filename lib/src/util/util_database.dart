import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/widgets.dart';
import 'package:mydo/src/model/model_mydo_item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  final String tableName = "mydo";
  final String createStatement = "CREATE TABLE mydo("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "title VARCHAR(50) NOT NULL,"
      "body TEXT NOT NULL,"
      "priority INTEGER  NOT NULL,"
      "created_at VARCHAR(50) NOT NULL,"
      "edited_at VARCHAR(50),"
      "due_date VARCHAR(50)"
      ");";

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "mydo.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db
        .execute(createStatement)
        .catchError((e) {
      print("Gagal");
    });
    print("Created tables");
  }

  Future<int> save(MyDoItem item) async {
    var dbClient = await db;
    int res = await dbClient.insert(tableName, item.toJson());
    return res;
  }

  Future<int> delete({int id}) async {
    var dbClient = await db;
    int res = await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<List<MyDoItem>> getItemList() async {
    var dbClient = await db;
    var res = await dbClient.query(tableName);
    return res.map((item) => MyDoItem.fromJson(item)).toList();
  }

  Future<MyDoItem> getItem({@required int id}) async {
    var dbClient = await db;
    var res = await dbClient.query(tableName, where: 'id = ?', whereArgs: [id]);
    return MyDoItem.fromJson(res.first);
  }
}
