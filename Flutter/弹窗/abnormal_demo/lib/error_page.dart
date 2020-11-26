import 'package:flutter/material.dart';

class ErrorPageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),

      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text('xxx')),
            ListTile(title: Text('xxx')),
            ListTile(title: Text('xxx')),
            ListTile(title: Text('xxx')),
          ],
        ),
      ),
    );
  }
}
