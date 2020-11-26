import 'package:flutter/material.dart';
import 'progress_hud10.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProgressHud10(key:this.key,loading: true ,color: Colors.red,width: 160,height: 160, child: Center(
        child: Text("加载动画简单示例"))),
    );
  }
}

