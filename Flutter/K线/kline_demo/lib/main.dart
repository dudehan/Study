import 'package:flutter/material.dart';
import 'kLine/k_line_container.dart';
import 'dart:math';

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
//      home: KLineDemo(),
      home: Demo(),
    );
  }


}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xxx'),
      ),
      body: LCKlineContainer(
        values: _randomValue(),
        size: Size(MediaQuery.of(context).size.width, 200),
//          size: Size(MediaQuery.of(context).size.width, 200),
      ),
    );
  }

  _randomValue() {
    List values = [];
    for (int i = 0; i < 30; i++) {
      int random = Random().nextInt(100) + 0;
      values.add(
              {'instrumentPL': random.toDouble(), 'time': '1978-07-02 03:40:51'});
    }
    return values;
  }
}

