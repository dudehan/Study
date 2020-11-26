import 'package:flutter/material.dart';
import 'first_page.dart';
import 'package:dark_mode_demo/theme/theme.dart';
import 'package:event_bus/event_bus.dart';
import 'event_bus.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'fit/size_fit.dart';

void main() => runApp(MultiProvider(
      providers: [
//        ChangeNotifierProvider.value(value: LCThemeProvider())
        ChangeNotifierProvider(create: (ctx) => LCThemeProvider()),
      ],

      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      SizeFit.initialize();
      print('screenWidth : ${SizeFit.screenWidth} ; screenHeight: ${SizeFit.screenHeight}');

      int a = 100;
      print('rpx : ${a.rpx}   px: ${100.px}');

    return MaterialApp(
      title: 'Flutter Demo',
      /// 主题
      theme: WXTheme.norTheme,
      darkTheme: WXTheme.darkTheme,
      builder: (ctx, child) {
          final width = MediaQuery.of(ctx).size.width;
        print('width ==== $width');
        ///可在此处获取模式发送通知
        print('isDark ===***=== ${MediaQuery.of(ctx).platformBrightness}');
//        switch (MediaQuery.of(ctx).platformBrightness) {
//          case Brightness.light:
////            lcEventBus.fire(ThemeModel(false));
//            Provider.of<LCThemeProvider>(context).isDark = false;
//            break;
//          case Brightness.dark:
////            lcEventBus.fire(ThemeModel(true));
//            Provider.of<LCThemeProvider>(context).isDark = true;
//            break;
//          default:
//        }
//        lcEventBus.fire();
        return child;
        print('调用了 Builder');
//        return Selector<LCThemeProvider,LCThemeProvider>(
//          selector:(ctx,provider) => provider,
//          shouldRebuild: (pre,next) => false,
//          builder: (ctx,model,child){
//            switch (MediaQuery.of(ctx).platformBrightness) {
//              case Brightness.light:
////                model.isDark = false;
//                break;
//              case Brightness.dark:
////                model.isDark = true;
//                break;
//
//              default:
//            }
//            return child;
//          },
//                child: child);
      },
      home: FirstPage(),
    );
  }
}
