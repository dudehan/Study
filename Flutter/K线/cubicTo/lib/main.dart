import 'package:flutter/material.dart';
import 'k_line.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('k线'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            child: CustomPaint(
              painter: LCKlinePainter(_getPoints()),
              size: Size(375, 300),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text('刷新数据'),
          )
        ],
      ),
    );
  }

  List<Point<double>> _getPoints() {
    List<Point<double>> points = [];
    for (int i = 0; i < 50; i++) {
      points.add(Point(i * 3.75 * 2, 50 * Random().nextDouble()));
    }
    return points;
  }
}
