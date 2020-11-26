import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/first_page.dart';
import '../pages/second_page.dart';
import '../pages/third_page.dart';
import '../pages/unknown_page.dart';


/// 兼容无context跳转
class WXNavigator {
  static NavigatorState of([BuildContext context]) {
    NavigatorState navigatorState = context == null ? Application.navigatorKey.currentState : Navigator.of(context);
    return navigatorState;
  }
}

class WXRouter {
  /// 根路由
  static final initialRoute = RoutePath.homePage;

  /// 路由定义
  static final Map<String, WidgetBuilder> routers = {
    RoutePath.homePage: (ctx) => HomePage(),
    RoutePath.firstPage: (ctx) => FirstPage(),
    RoutePath.secondPage: (ctx) => SecondPage(),
    RoutePath.thirdPage: (ctx) => ThirdPage(),
  };

  /// 通过构造函数传参方式传参的路由设置
  static RouteFactory onGenerateRoute = (settings) {
    ///如需添加转场动画示例：
    if (settings.name == RoutePath.secondPage) {
      return PageRouteBuilder(
        settings: settings,
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (ctx, animation1, animation2) {
          return FadeTransition(
            opacity: animation1,
            child: SecondPage(),
          );
        },
      );
    }

    if (settings.name == RoutePath.thirdPage) {
      Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        /// 建议设置一下settings，配置后可通过[ModalRoute.of(context).settings]获取
        settings: settings,
        builder: (ctx) {
          return ThirdPage(
            message: map['message'],
            value: map['value'],
          );
        },
      );
    }

//    if (settings.name == SecondPage.routeName) {
//      return PageRouteBuilder(
//        transitionDuration: Duration(seconds:2),
//        pageBuilder: (ctx, animation1, animation2) {
//        return ScaleTransition(scale: animation1,child: SecondPage());
//      });
//    }

    return null;
  };

  /// 未知页面
  static RouteFactory onUnknownRoute = (setting) {
    return MaterialPageRoute(
        settings: setting,
        builder: (ctx) {
          return UnknownPage();
        });
  };
}

///申明路由名称
class RoutePath {
  static const String homePage = '/home';
  static const String firstPage = '/first';
  static const String secondPage = '/second';
  static const String thirdPage = '/third';
}


class Application {
  /// 全局navigatorKey
  static GlobalKey<
          NavigatorState> navigatorKey = GlobalKey();
}