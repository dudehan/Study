import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'first_page.dart';
import 'second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'first': (pageName, params, _) => FirstPage(),
      'second': (pageName, params, _) => SecondPage(),
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container(
            color:Colors.white
        ));
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
  }
}

