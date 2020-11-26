import 'package:sp_util/sp_util.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';

class WXWalletDB {
  /// 每一个钱包对应一个数据表，
  static const String DataPersistenceKey = 'DataPersistenceKey';
  static const String DataPersistenceValue = 'DataPersistenceValue';

  /// walletTable 记录所有钱包的表名
  static const walletTable = 'walletTable';
  static const String walletName = 'walletName';

  /// 写数据(如果存在此字段则直接替换)
  static insertDataWithKey(String table, String key, dynamic data) async {
    /// 打开数据库
    Database db = await _openWalletDatabase(table);

    /// 根据key获取数据库数据
    List<Map<String, dynamic>> list = await db.query(table,
        columns: [DataPersistenceKey],
        where: '$DataPersistenceKey = ?',
        whereArgs: [key]);

    String jsonString = json.encode(data);
    if (list.length > 0) {
      /// 存在则更新
      Map<String, dynamic> values = {DataPersistenceValue: jsonString};
      db.update(table, values,
          where: '$DataPersistenceKey = ?', whereArgs: [key]);
    } else {
      /// 不存在则添加
      db.insert(
          table, {DataPersistenceKey: key, DataPersistenceValue: jsonString});
    }
    db.close();
  }

  /// 从对应的钱包表里读取数据
  static Future<dynamic> getWalletDataWithKey(String table, String key) async {
    /// 打开数据库
    Database db = await _openWalletDatabase(table);

    /// 获取数据库数据
    List<Map<String, dynamic>> result = await db.query(table,
        columns: [DataPersistenceValue],
        where: '$DataPersistenceKey = ?',
        whereArgs: [key]);

    if (result.length > 0) {
      String string = result[0][DataPersistenceValue];
      return json.decode(string);
    }
    db.close();
    return result;
  }

  /// 删除数据
  static deleteKeyValue(String table, String key) async {
    /// 打开数据库
    Database db = await _openWalletDatabase(table);
    db.delete(table, where: '$DataPersistenceKey = ?', whereArgs: [key]);
  }

  /// 删除表
  static deleteTable(String table) async {
    String dataBasePath = await getDatabasesPath();
    String path = '$dataBasePath/$table.db';
    await deleteDatabase(path);
    Database db = await _openWalletTableDatabase();
    db.delete(walletTable, where: '$walletName = ?', whereArgs: [table]);
  }

  /// 获取所有钱包列表
  static Future<List<dynamic>> getWalletList() async {
    /// 打开数据库
    Database db = await _openWalletTableDatabase();

    /// 获取数据库数据
    List<dynamic> data = await db.query(walletTable, columns: [walletName]);
    List result = [];
    data.forEach((element) {
      result.add(element[walletName]);
    });
    db.close();
    return result;
  }

  /// 打开数据库
  /// 每个钱包对应的表
  static Future<Database> _openWalletDatabase(String table) async {
    String dataBasePath = await getDatabasesPath();
    String path = '$dataBasePath/$table.db';

    /// 打开数据库
    Database db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      /// 未创建会走此处创建数据库
      await db.execute(
          'CREATE TABLE $table (id INTEGER PRIMARY KEY, $DataPersistenceKey TEXT, $DataPersistenceValue TEXT)');
      await db.execute(
              'CREATE TABLE test1 (id INTEGER PRIMARY KEY, $DataPersistenceKey TEXT, $DataPersistenceValue TEXT)');
      await db.execute(
              'CREATE TABLE test2 (id INTEGER PRIMARY KEY, $DataPersistenceKey TEXT, $DataPersistenceValue TEXT)');
      List list =  await db.rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
      print(list.toString());

      Database walletTableDb = await _openWalletTableDatabase();
      /// 获取数据库数据
      List<Map<String, dynamic>> result = await walletTableDb.query(walletTable,
          columns: [walletName], where: '$walletName = ?', whereArgs: [table]);
      if (result.length == 0) {
        walletTableDb.insert(walletTable, {walletName: table});
        walletTableDb.close();
      }
    });
    return db;
  }

  /// 记录所有钱包的表
  static Future<Database> _openWalletTableDatabase() async {
    String dataBasePath = await getDatabasesPath();
    String path = '$dataBasePath/$walletTable.db';
    print('dataBasePath === $dataBasePath');
    /// 打开数据库
    Database db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $walletTable (id INTEGER PRIMARY KEY, $walletName TEXT)');
    });
    return db;
  }

}
