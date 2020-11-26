import 'package:flutter/cupertino.dart';

import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';
import 'package:flutter/material.dart';

class ModuleA {

  Map<String, dynamic> maps = {};


  static Route<dynamic> onGenerateRoute(settings) {
    switch (settings.name) {
      case '/firstPage':
        return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return FirstPage();
            });
        break;
      case '/secondPage':
        return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return SecondPage();
            });
        break;
      case '/thirdPage':
          Map<String, dynamic> arguments = settings.arguments;

        return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return ThirdPage(message: arguments['message'],value: arguments['value'],);
            });
        break;
    }
    return null;
  }

}




