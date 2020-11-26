import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../config/application.dart';
import '../config/routes.dart';
import '../config/fluro_convert_util.dart';
import 'dart:convert';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('firstpage')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Map<String, dynamic> data = {
              'name': 'jack',
              'nickName': '狗蛋',
              'age': 10,
              'height': 99.5,
            };

            String name = 'jack';
            String nickName = '狗蛋';
            int age = 10;
            double height = 99;

            String mName = FluroConvertUtils.fluroCnParamsEncode(nickName);

            /// 对自定义类型 转为 json string
            // String personJson = FluroConvertUtils.object2string(p);

            String jsonString = json.encode(data);
            var jsons = jsonEncode(Utf8Encoder().convert(jsonString));
            String params =
                '?name=$name&age=$age&nickName=$mName&height=$height&jsonString=$jsons';
            //自定义转场动画
            var transition = (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              return new ScaleTransition(
                scale: animation,
                child: new RotationTransition(
                  turns: animation,
                  child: child,
                ),
              );
            };
            var fadeTransition = (BuildContext context,Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                };


            Application.router.navigateTo(
              context,
              Routes.secondPage + params,
              transition: TransitionType.custom,
              transitionBuilder: fadeTransition,
              transitionDuration: Duration(milliseconds: 600),
              replace: false,
            );
            // Application.router.navigateTo(
            //   context,
            //   Routes.secondPage + params,
            //   transition: TransitionType.native,
            //   replace: false,
            // );

            // Application.router.pop(context);
          },
          child: Text('route to secondPage'),
        ),
      ),
    );
  }
}
