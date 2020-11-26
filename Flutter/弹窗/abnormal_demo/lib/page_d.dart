import 'package:flutter/material.dart';
import 'package:new_demo/application.dart';

class PageD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<NavigatorObserver> observers = Navigator.of(context).widget.observers;
//    print('PageD ===== ${observers.first.}');
    return Scaffold(

      appBar: AppBar(
        title: Text('PageD'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Application.navigatorKey.currentState.pop();
          },
          child: Text('返回到firstPage'),
        ),
      ),
    );
  }
}
