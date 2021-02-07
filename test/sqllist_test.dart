import 'dart:io';

import 'package:flutter_app/obj/INTEREST.dart';

import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  final String TableName = 'Interest';

  DBHelper._();
  static final DBHelper _db = DBHelper._();
  factory DBHelper() => _db;

  static Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'DB.db');

    return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE $TableName(
            isu_cd TEXT PRIMARY KEY,
          )
        ''');
        },
        onUpgrade: (db, oldVersion, newVersion){}
    );
  }

  createData(INTEREST interest) async {
    final db = await database;
    var res = await db.rawInsert('INSERT INTO $TableName(name) VALUES(?)', [interest.isu_cd]);
    return res;
  }

  Future<List<INTEREST>> selectData() async {
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM $TableName');
    List<INTEREST> list = res.isNotEmpty ? res.map((c) => INTEREST(isu_cd:c['isu_cd'])).toList() : [];

    return list;
  }
}