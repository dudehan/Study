import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'application.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,   // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate,  // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate,    // 指定默认的文本排列方向, 由左到右或由右到左
        S.delegate
      ],
//      localizationsDelegates: [
//        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
//        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
//        GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
//      ],
//      supportedLocales: [
//        Locale("en"),
//        Locale("zh")
//      ],
      navigatorKey: Application.navigatorKey,
      home: TestDemo(),
    );
  }
}

class TestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(S.of(context).time),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
