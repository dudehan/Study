import 'package:flutter/material.dart';
import '../config/application.dart';

class ThirdPage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          ///first -> second -> third
          ///如何实现从third返回first，同时释放掉second？
          Application.router.pop(context);
          
          // Navigator.
        },
        child: Text('back'),
      ),
    );
  }
}
