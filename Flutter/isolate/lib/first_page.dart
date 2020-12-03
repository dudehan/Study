import 'wx_isolate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: Center(
        child: FutureBuilder(
          // future: getDataByCompute(),
          future: getDataByIsolate(),
          builder: (ctx, snap) {
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
  Future<String> getDataByIsolate() async {
   String str =
    await WXIsolate.addIsolateTask<String>(
            timeConsumingTask, 'getName');
    return str;
  }

  /// compute 测试
  Future<String> getDataByCompute() async {
    String str = await compute(timeConsumingTask, 'getName');
    return str;
  }
  /// 耗时任务
  static String timeConsumingTask(String str) {
    // sleep(Duration(seconds: 3));
    int index = 0;
    while(index < 2000000000) {
      index ++;
    }
    return '$str : jack';
  }
}
