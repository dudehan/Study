
import 'package:flutter/material.dart';
import 'first_page.dart';

import 'lc_event_bus.dart';
import 'package:event_bus/event_bus.dart';

LCEventBus lcEventBus = LCEventBus.manager();
EventBus eventBus = EventBus();


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  void initState() {
    lcEventBus.on((obj){
      print('obj ===== $obj');
    });



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return FirstPage();
            }));
          },
          child: Text('按钮'),
        ),
      ),
    );
  }
}
