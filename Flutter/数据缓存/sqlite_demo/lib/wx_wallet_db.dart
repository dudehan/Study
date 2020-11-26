import 'dart:convert';
import 'package:sqflite/sqflite.dart';


class WXDataBaseUtil {
  /// 每一个钱包对应一个数据表，
  static const String DataPersistenceKey = 'DataPersistenceKey';
  static const String DataPersistenceValue = 'DataPersistenceValue';

  static Database _dataBase;

  /// 插入数据(如果存在此字段则直接替换)
  static insert(String table, String key, dynamic data) async {
    /// 打开数据库
    bool isExist = await isTableExist(table);
    if (!isExist) {
      // _tableAssert(table, isExist);
      createTable(table);
      return;
    }
    Database db = await _openDatabase();
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
    // db.close();
  }

  /// 查询
  static Future query(String table, String key) async {
    /// 打开数据库
    bool isExist = await isTableExist(table);
    if (!isExist) {
      _tableAssert(table, isExist);
      return null;
    }
    print('xxx');
    Database db = await _openDatabase();
    /// 获取数据库数据
    List result = await db.query(table,
        columns: [DataPersistenceValue],
        where: '$DataPersistenceKey = ?',
        whereArgs: [key]);

    if (result.length > 0) {
      String string = result[0][DataPersistenceValue];
      return json.decode(string);
    }
    // db.close();
    return result;
  }

  /// 删除数据
  static delete(String table, String key) async {
    /// 打开数据库
    Database db = await _openDatabase();
    bool isExist = await isTableExist(table);
    if (isExist) {
      await db.delete(table, where: '$DataPersistenceKey = ?', whereArgs: [key]);
      return;
    }
    // db.close();
  }

  /// 创建表
  static Future createTable(String tableName) async {
    bool isExist = await isTableExist(tableName);
    Database db = await _openDatabase();
    if (!isExist) {
      await db.execute(
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, $DataPersistenceKey TEXT, $DataPersistenceValue TEXT)');
    }
    // db.close();
  }

  /// 删除表
  static deleteTable(String tableName) async {
    Database db = await _openDatabase();
    bool isExist = await isTableExist(tableName);
    if (isExist) {
      await db.execute('DROP TABLE $tableName');
      return;
    }
    // db.close();
  }

  /// 判断某个表是否存在
  static Future<bool> isTableExist(String tableName) async {
    Database db = await _openDatabase();
    List list = await db.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    // db.close();
    return list.length > 0 ? true : false;
  }

  /// 获取所有列表
  static Future<List<Map<String, dynamic>>> getAllTable() async {
    Database db = await _openDatabase();
    List<Map<String, dynamic>> list = await db
        .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    return list;
  }

  /// 打开数据库
  static Future<Database> _openDatabase() async {
    if (_dataBase != null && _dataBase.isOpen) return _dataBase;
    String dataBasePath = await getDatabasesPath();
    String path = '$dataBasePath/wallet.db';
    print('path ==== $path');
    _dataBase = await openDatabase(path);
    return _dataBase;
  }
}

_tableAssert(String table, bool isExist) {
  assert(() {
    if (!isExist) {
      print('$table表不存在');
    }
    return true;
  }());
}
