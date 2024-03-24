import 'dart:developer';

import 'package:note_app/model/category_model.dart';
import 'package:note_app/model/note_model.dart';
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
      // Table Note
      await db.execute(
          'CREATE TABLE ${entity.noteTable} (${entity.noteId} INTEGER PRIMARY KEY AUTOINCREMENT, ${entity.noteTitle} TEXT, ${entity.noteDesctription} TEXT, ${entity.categoryOfNote} TEXT,${entity.date} TEXT,${entity.codeColor} TEXT)');
    });
  }

  // CRUD Category
  Future<bool> insertCategory({required CategoryModel category}) async {
    var db = await initDataBase();
    await db.insert(entity.categoryTable, category.toMap());
    return true;
  }

  Future<List<CategoryModel>> getCategory() async {
    var db = await initDataBase();
    List<Map<String, dynamic>> result = await db.query(entity.categoryTable);
    return result.map((e) => CategoryModel.fromMap(e)).toList();
  }

  void updateCategory(
      {required CategoryModel category, required int categoryId}) async {
    var db = await initDataBase();
    await db.update(entity.categoryTable, category.toMap(),
        where: '${entity.categoryId}=?', whereArgs: [categoryId]);
  }

  void deleteCategory({required int categoryId}) async {
    var db = await initDataBase();
    await db.delete(entity.categoryTable,
        where: '${entity.categoryId}=?', whereArgs: [categoryId]);
  }

  // CRUD NOTE
  Future<bool> insertNote({required NoteModel note}) async {
    var db = await initDataBase();
    await db.insert(entity.noteTable, note.toMap());
    return true;
  }

  Future<List<NoteModel>> getNote() async {
    var db = await initDataBase();
    List<Map<String, dynamic>> result = await db.query(entity.noteTable);
    for (var data in result) {
      log(data[entity.date]);
    }
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }

  void updateNote({required NoteModel note, required int noteId}) async {
    var db = await initDataBase();
    await db.update(entity.noteTable, note.toMap(),
        where: '${entity.noteId}=?', whereArgs: [noteId]);
  }

  void deleteNote({required int noteId}) async {
    var db = await initDataBase();
    await db.delete(entity.noteTable,
        where: '${entity.noteId}=?', whereArgs: [noteId]);
  }
}
