import 'dart:io';
import 'wx_isolate.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static String name = 'jack';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: Center(
        child: FutureBuilder(
          // future: getDataByCompute('test'),
          future: getDataByIsolate(),
          builder: (ctx, snap) {
            print(snap);
            if (snap.hasData) {
              return Text(snap.data.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  /// isolate 测试
  Future<Map<String, dynamic>> getDataByIsolate() async {
    Map<String, dynamic> str =
        await WXIsolate.addIsolateTask<Map<String, dynamic>>(
            callBack, {'title': 'title'});
    return str;
  }

  static Map<String, dynamic> callBack(dynamic data) {
    sleep(Duration(seconds: 3));
    return data;
  }

  /// compute 测试
  Future<String> getDataByCompute(String str1) async {
    String str = await compute(test, str1);
    String str2 = await compute(test, str1);
    return str + str2;
  }

  static String test(String str) {
    // sleep(Duration(seconds: 3));
    int index = 0;
    while(index < 1000000000) {
      index ++;
    }
    return '$name :+ $str';
  }


}
