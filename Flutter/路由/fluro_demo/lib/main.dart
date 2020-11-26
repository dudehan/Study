import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './config/routes.dart';
import './config/application.dart';



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
      title: 'xxxx',
      onGenerateRoute: Application.router.generator,
    );
  }
}


