import 'dart:developer';

import 'package:note_app/model/category_model.dart';
import 'package:note_app/utility/constant/constant_key.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDataCon {
  final entity = Entity();
  Future<Database> initDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'noteDemo.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // Table Category
      await db.execute(
          'CREATE TABLE ${entity.categoryTable} (${entity.categoryId} INTEGER PRIMARY KEY AUTOINCREMENT, ${entity.categorName} TEXT)');
      // Table Category
      await db.execute(
          'CREATE TABLE ${entity.noteTable} (${entity.noteId} INTEGER PRIMARY KEY AUTOINCREMENT, ${entity.noteTitle} TEXT, ${entity.noteDesctription} TEXT, ${entity.categorName} TEXT,${entity.date} TEXT)');
    });
  }

  // CRUD Category
  void insertCategory({required CategoryModel category}) async {
    var db = await initDataBase();
    await db.insert(entity.categoryTable, category.toMap());
    log('message added');
  }
}
