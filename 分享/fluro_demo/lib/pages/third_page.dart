import 'package:fluro_demo/config/routes.dart';
import 'package:flutter/material.dart';
import '../config/application.dart';

class ThirdPage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ThirdPage"),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            ///first -> second -> third
            ///如何实现从third返回first，同时释放掉second？
            Navigator.of(context).popUntil(ModalRoute.withName(Routes.firstPage));
            Navigator.of(context).pop();
//            Navigator.of(context).popUntil(ModalRoute.withName(''));
            //To support "Navigator.of(context).popUntil(ModalRoute.withName(''))",
            //we can also get the name and parameters through "ModalRoute.of(context).settings”

          },
          child: Text('back'),
        ),
      ),
    );
  }
}