import 'package:flutter/material.dart';
import 'first_page.dart';
import 'application.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData.light(),
      home: FirstPage(),
      navigatorKey: Application.navigatorKey,
    );
  }
}
