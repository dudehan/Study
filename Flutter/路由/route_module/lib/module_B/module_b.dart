import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page_a.dart';
import 'page_b.dart';
import 'page_c.dart';
import 'page_d.dart';

class ModuleB {
  static Route<dynamic> onGenerateRoute(settings) {
    switch (settings.name) {
      case '/pageA':
        return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return PageA();
            });
        break;
      case '/pageB':
        return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return PageB();
            });
        break;
      case '/pageC':
        return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return PageC();
            });
        break;
      case '/pageD':
        return MaterialPageRoute(
            settings: settings,
            builder: (ctx) {
              return PageD();
            });
        break;
    }
    return null;
  }
}
