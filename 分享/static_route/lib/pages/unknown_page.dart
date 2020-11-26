import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  @override
  _UnknownPageState createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnknownPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('您跳转的路由不存在 ${ModalRoute.of(context).settings.name}')
          ],
        ),
      ),
    );
  }
}
