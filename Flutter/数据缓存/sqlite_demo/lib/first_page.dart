import 'package:sqlite_demo/wx_data_util.dart';

import 'wx_wallet_db_old.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sqlite_demo/wx_wallet_db.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    print('first page build : ...');
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _createDB('wallet_0');
              },
              child: Text('新建新钱包：wallet_0'),
            ),
            RaisedButton(
              onPressed: () {
                _createDB('wallet_1');
              },
              child: Text('新建新钱包：wallet_1'),
            ),
            RaisedButton(
              onPressed: () {
                _createDB('wallet_2');
              },
              child: Text('新建新钱包：wallet_2'),
            ),
            RaisedButton(
              onPressed: _insert,
              child: Text('insert'),
            ),
            RaisedButton(
              onPressed: () {
                _query('wallet_0', 'coins0');
              },
              child: Text('查询'),
            ),
            RaisedButton(
              onPressed: () {
                _modify('wallet_0', 'coins0');
              },
              child: Text('修改'),
            ),
            RaisedButton(
              onPressed: () {
                _delete('wallet_0', 'coins0');
              },
              child: Text('删除字段'),
            ),
            RaisedButton(
              onPressed: () {
                _deleteTable('wallet_0');
              },
              child: Text('删除表'),
            ),
            RaisedButton(
              onPressed: () {
                _getWalletTableList();
              },
              child: Text('获取钱包列表'),
            ),
            Divider(color: Colors.grey),
            RaisedButton(
              onPressed: () {
                SpUtil.putString('key', 'value');
              },
              child: Text('putString'),
            ),
          ],
        ),
      ),
    );
  }
}

_delete(String table, String key) async {
  await WXDataBaseUtil.delete(table, key);
  // await WXWalletDB.deleteKeyValue(table, key);
}

_deleteTable(String table) async {

  WXDataBaseUtil.deleteTable(table);

  // await WXWalletDB.deleteTable(table);
}

_getWalletTableList() async {
  List list = await WXDataBaseUtil.getAllTable();
  // List list = await WXWalletDB.getWalletList();
  print('list === $list');
}

_createDB(String name) async {

  WXDataBaseUtil.createTable(name);

  // Map<String, dynamic> data = {'key1': 'aaaa', 'key2': 'bbbb'};
  // WXWalletDB.insertDataWithKey(name, 'coins', data);
}

_modify(String table, String key) async {
  Map<String, dynamic> data = {
    'name': 'coins_0_modify',
    'value': 'gouDan_0_modify'
  };
  WXDataBaseUtil.insert(table, key, data);
  // WXWalletDB.insertDataWithKey(table, key, data);
}

_insert() async {
  for (int i = 0; i < 5; i++) {
    await WXDataBaseUtil.insert(
        'wallet_0', 'coins$i', "{'name': 'wallet_$i', 'value': 'gouDan_$i'}");
  }
}

_query(String tableName, String key) async {
  dynamic data = await WXDataBaseUtil.query(tableName, key);
  // dynamic data = await WXWalletDB.getWalletDataWithKey(tableName, key);
  print('data ==== $data');
}
