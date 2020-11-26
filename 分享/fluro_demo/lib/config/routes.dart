import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
import '../fluro/fluro.dart';
import 'route_handle.dart';



class Routes {
  static String root = '/';
  //标识符，用于导航时在路由树中查找节点
  static String firstPage = '/first';
  static String secondPage = '/second';
  static String thirdPage = '/third';
  
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
        return null;
      });
    //define会创建route节点，同时将该节点添加进路由树中（routeTree），以rootPath作为匹配标识
    router.define(root, handler: rootHandler);
    router.define(firstPage, handler: firstPageHandler,transitionType: TransitionType.native);
    router.define(secondPage, handler: secondPageHandler,transitionType: TransitionType.native);
    router.define(thirdPage, handler: thirdPagePageHandler,transitionType: TransitionType.native);


  }
}
