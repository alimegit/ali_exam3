import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/allproducts_model.dart';

class LocalDatabase {
  // 1-qism Singelton qildik!
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }
  //-----1-qism tugadi
  //2-qism nullable obyektini elon qildik,
  Database? _database;
// 3-qism  Databaseni getterini yozvoldik
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("exam.db");
      return _database!;
    }
  }

  //4-qism init metodi
  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    //join yangi adres hosil qilib beryabdi
    String path = join(internalPath, databaseName);
    // databasani nomini ochyabmiz
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";
    const floatType = "FLOAT DEFAULT 0.0";

    await db.execute('''CREATE TABLE basket (
      id $idType,
      name $textType,
      count $intType,
      product_id $intType,
      image_url $textType,
      price $intType,
      isFavourite $intType
    )''');
  }
  //------------------TASKS--------------------------------------

  static Future<ProductsModel> insertProduct(ProductsModel productsModel) async {
    debugPrint("INITIAL ID:${productsModel.dbId}");
    final db = await databaseInstance.database;
    int savedCoffeeID = await db.insert("basket", productsModel.toJson());
    debugPrint("SAVED ID:$savedCoffeeID");
    return productsModel.copyWith(dbId: savedCoffeeID);
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    final db = await databaseInstance.database;
    String orderBy = "id DESC"; //"_id DESC"
    List json = await db.query("basket", orderBy: orderBy);
    return json.map((e) => ProductsModel.fromJson(e)).toList();
  }

  static Future<int> deleteProduct(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      "basket",
      where: "_id = ?",
      whereArgs: [id],
    );
    return deletedId;
  }

  static Future<int> updateCoffee(
      ProductsModel productsModel,
      int id,
      ) async {
    debugPrint("UPDATE: ${productsModel.toJson()} ${productsModel.dbId}");
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      "coffees",
      productsModel.toJson(),
      where: "_id = ?",
      whereArgs: [id],
    );
    return updatedTaskId;
  }

  static Future<int> updateCoffeeCount({
    required int count,
    required int productId,
  }) async {
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      "basket",
      {"count": count},
      where: "_id = ?",
      whereArgs: [productId],
    );
    return updatedTaskId;
  }

  static Future<int> updateCoffeeFavourite({
    required bool isFavourite,
    required int productId,
  }) async {
    final db = await databaseInstance.database;
    int updatedTaskId = await db.update(
      "basket",
      {
        "is_favourite": isFavourite ? 1 : 0,
      },
      where: "_id = ?",
      whereArgs: [productId],
    );
    return updatedTaskId;
  }
}
