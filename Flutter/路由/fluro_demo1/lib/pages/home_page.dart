// import 'package:fluro/fluro.dart';
import '../fluro/fluro.dart';
import 'package:fluro_demo/config/routes.dart';
import 'package:flutter/material.dart';
import '../config/application.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Application.router.navigateTo(
              context,
              Routes.firstPage,
              transition: TransitionType.cupertino,
              replace: false,
            );
            // Navigator.push(context, route)
          },
          child: Text('Navigate to First Page'),
        ),
      ),
    );
  }
}
