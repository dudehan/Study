import 'package:fluro_demo/pages/first_page.dart';
import 'package:fluro_demo/pages/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
import './fluro/fluro.dart';
import './config/routes.dart';
import './config/application.dart';
import './native_route_pages/page_a.dart';



void main() {

  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // onGenerateRoute: Application.router.generator,
      home: HomePage(),
    );
  }
}

