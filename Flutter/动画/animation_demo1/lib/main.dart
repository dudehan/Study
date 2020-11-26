import 'package:flutter/material.dart';
// import 'demo2.dart';
// import 'demo3.dart';
import 'demo5.dart';


void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Flutter Experiments',
            theme: new ThemeData(
            ),
            home:RotationAnimationDemo(),
            debugShowCheckedModeBanner: false,
        );
    }
}