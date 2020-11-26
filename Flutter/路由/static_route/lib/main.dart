import 'package:flutter/material.dart';
import 'package:static_route/routers/router.dart';
import 'pages/home_page.dart';
import 'pages/first_page.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';
import 'pages/unknown_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      navigatorKey: Application.navigatorKey,
      /// 路由配置
      routes: WXRouter.routers,
      onGenerateRoute: WXRouter.onGenerateRoute,
      onUnknownRoute: WXRouter.onUnknownRoute,
      initialRoute: WXRouter.initialRoute,
    );
  }
}
