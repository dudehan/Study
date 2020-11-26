import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage'),),
      body: Container(
        child: Center(
          child: WidgetsApp(color: Colors.yellow),
        ),
      ),
    );
  }
}