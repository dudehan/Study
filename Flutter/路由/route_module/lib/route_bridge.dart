import 'module_A/module_a.dart';
import 'module_B/module_b.dart';
import 'package:flutter/material.dart';


List<RouteFactory> moduleRoute = [
    ModuleA.onGenerateRoute,
    ModuleB.onGenerateRoute
];

///modueA/pageA
/// 路由配置
class AppRouter {

  static Route<dynamic> onGenerateRoute(settings) {
    Route route;
    int index = 0;
    while (route == null && index < moduleRoute.length) {
      route = moduleRoute[index](settings);
      index ++;
    }
    return route;
  }

}
class moduelNames {
  static String moduleA = "moduleA";

  static getPath(String moduleName,String pageName) {

  }
}




