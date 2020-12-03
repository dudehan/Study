import 'dart:async';

import 'package:flutter/material.dart';
import 'list_page.dart';

// void main() => runApp(MyApp());

void main() {
  runZoned(
    () => runApp(MyApp()),
    zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      parent.print(zone, "Intercepted: $line");
    }),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'list view widget', home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print('home build ...');
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      // body: LCListView(),
      body: Container(
        child: RaisedButton(
          child: Text('按钮'),
          onPressed: () {
            print('xxxx');
          },
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        // scrollDirection: Axis.horizontal,//横向列表,默认上下列表
        children: <Widget>[
          // new ListTile(
          //   leading:new Icon(Icons.android),
          //   title: new Text('biaoti'),
          // ),

          // new Image.network('https://img1.mukewang.com/szimg/5e6f2f240847796506000338-360-202.jpg'),
          // new Image.network('https://img1.mukewang.com/szimg/5ea0118b0948c90a12000676-360-202.png'),
          // new Image.network('https://img1.mukewang.com/szimg/5e54bebe087fe86d06000338-360-202.jpg'),
        ]);
  }
}
