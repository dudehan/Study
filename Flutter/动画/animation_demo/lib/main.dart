import 'package:animation_demo/logo_app_demo.dart';
import 'package:flutter/material.dart';
// import 'logo_app_demo.dart';
// import 'canvas_circle.dart';
import 'demo3.dart';
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
      ),
      // home: RotationAnimationDemo(),
      home: LogoApp(),
    );
  }
}


