import 'package:flutter/material.dart';
import 'exchange_ensure.dart';

class WalletDetails extends StatefulWidget {
  @override
  _WalletDetailsState createState() => _WalletDetailsState();
}

class _WalletDetailsState extends State<WalletDetails> {
  String _name = 'lanci';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 221, 221, 1),
      appBar: AppBar(title: Text('钱包详情')),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              _walletInfoTitle(),
              _wallerName(_name),
              _divider(),
              _exportKey(),
            ],
          ),
          _deleteWallet()
        ],
      ),
    );
  }

  Positioned _deleteWallet() {
    return Positioned(
      bottom: 100,
      height: 45,
      left: 50,
      right: 50,
      child: RaisedButton(
        color: Colors.orangeAccent,
        onPressed: () {
          _openAlertDialog(context);

        },
        child: Text(
          '删除钱包',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container _exportKey() {
    return Container(
      color: Color.fromRGBO(250, 250, 250, 1),
      child: ListTile(
        leading: Text('导出私钥'),
        trailing: IconButton(
          splashColor: Color.fromRGBO(250, 250, 250, 1),
          icon: Icon(Icons.navigate_next),
          onPressed: () {
            print('xxxx');
          },
        ),
      ),
    );
  }

  Divider _divider() {
    return Divider(
        color: Color.fromRGBO(221, 221, 221, 1),
        height: 2,
        indent: 15,
        endIndent: 15);
  }

  Container _wallerName(String name) {
    return Container(
      color: Color.fromRGBO(250, 250, 250, 1),
      child: ListTile(
        leading: Text('钱包名称'),
        trailing: Text(name),
      ),
    );
  }

  Container _walletInfoTitle() {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 15),
      height: 30,
      child: Text(
        '钱包信息',
        style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1), fontSize: 12),
      ),
    );
  }
}

Future _openAlertDialog(BuildContext context) async {
  final action = await showDialog(
    context: context,
    barrierDismissible: false,
    //// user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('提示'),
        content: Text('是否删除?'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          FlatButton(
            child: Text('确认'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );

  if (action == true) {
    print('true');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return ExchangeEnsure();
        },
      ),
    );
  }
  if (action == false) {
    print('false');
  }
}
