import 'package:flutter/material.dart';
import 'package:new_demo/toast.dart';
import 'first_page.dart';
import 'application.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Application.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage(),
      ),
    );
  }
}
