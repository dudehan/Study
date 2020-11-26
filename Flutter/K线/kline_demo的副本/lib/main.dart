import 'package:flutter/material.dart';
import './kLine/k_line_page.dart';
import 'kLine/test.dart';

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
      home: KLineDemo(),
//      home: Scaffold(
//        appBar: AppBar(title: Text('xxx'),),
//        body: TestDemo(header: (offset) {
//          print(offset);
//          return Container(
//            child: Text('xxxxxxxx'),
//          );
//        }),
//      ),
    );
  }
}
