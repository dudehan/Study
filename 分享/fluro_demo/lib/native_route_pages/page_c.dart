
import 'package:flutter/material.dart';
import 'page_d.dart';
import 'page_d.dart';

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageC'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (builder) {
              //   return PageD();
              // }), (route) => true);
              // Navigator.of(context).popUntil()
            },
            child: Text('xxx'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
              
            },
            child: Text('back'),
          ),
        ],
      )),
    );
  }
}
