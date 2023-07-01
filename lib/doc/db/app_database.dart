import 'dart:async';

import 'package:doc_on_call_24_7_mobile/db/user_dao.dart';
import 'package:doc_on_call_24_7_mobile/entity/user_general.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 3, entities: [UserGeneral])
abstract class AppDatabase extends FloorDatabase{
  static AppDatabase _instance;

  static AppDatabase getInstance() {
    return _instance;
  }

  UserDao get userkDao;

  static Future<void>  init() async {
    _instance = await $FloorAppDatabase.databaseBuilder("doc_on_call.db").build();
  }
}