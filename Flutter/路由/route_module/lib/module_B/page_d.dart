import 'package:flutter/material.dart';

class PageD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pageD'),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName('/firstPage'));
            // Navigator.pushAndRemoveUntil(context, newRoute, predicate)
          },
          child: Text('返回firstPage'),
        ),
      ),
    );
  }
}