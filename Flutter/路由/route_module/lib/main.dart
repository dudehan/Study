import 'package:flutter/material.dart';
import 'package:static_route/route_bridge.dart';
import './home_page.dart';
//import 'package:module/module.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: HomePage(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

void test() {

}
