


import 'dart:async';
import 'package:agro_ecomance/entity/dao/cartDao.dart';
import 'package:agro_ecomance/entity/dao/wishDao.dart';
import 'package:agro_ecomance/entity/myEntity/WishEntity.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'database.g.dart'; // the generated code will be there

@Database(version: 4, entities: [CartDataa,Wishe])
abstract class AppDatabase extends FloorDatabase {


  static AppDatabase _instance;


  CartDataDao get cartDataDao;
  WishDataDao get wishDataDao;


  static AppDatabase getInstance() {

    return _instance;
  }
 static List<Migration> migrations = [];



  static Future<void>  init() async {

    _instance = await $FloorAppDatabase
        .databaseBuilder("agro_ecomancye.db")
        .build();
  }

}