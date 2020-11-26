import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicMsgChannelDemo extends StatefulWidget {
  @override
  _BasicMsgChannelDemoState createState() => _BasicMsgChannelDemoState();
}

class _BasicMsgChannelDemoState extends State<BasicMsgChannelDemo> {
  String title = 'flutter - basicMsgChannel';
  static const messageChannel =
      const BasicMessageChannel('com.flutterbus/demo', StandardMessageCodec());

  Future<Map> sendMessage(Map arguments) async {
    Map reply = await messageChannel.send(arguments);
    //解析 原生发给 Flutter 的参数
    int code = reply["code"];
    String method = reply["method"];

    //更新 Flutter 中页面显示
    setState(() {
      title = "code:$code method:$method";
    });
    return reply;
  }
  Future setMessageChannelMethodHandle() async {
    Future<String> messageHandle() async {
      print('nativeCallFlutter_result ======== ');
      return '回调结果';
    }
    messageChannel.setMessageHandler((message) => messageHandle());
  }
  
  void test() {
    print('test ======= ');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: [
            Text(title),
            RaisedButton(
              onPressed: () {
                sendMessage(
                    {"method": "test", "ontent": "flutter 中的数据", "code": 100});
              },
              child: Text('test'),
            ),
            RaisedButton(
              onPressed: () {
                sendMessage(
                    {"method": "test2", "ontent": "flutter 中的数据", "code": 101});
              },
              child: Text('test1'),
            ),
            RaisedButton(
              onPressed: () {
                sendMessage(
                    {"method": "test3", "ontent": "flutter 中的数据", "code": 102});
              },
              child: Text('test2'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            sendMessage(
                    {"method": "exitFlutter", "ontent": "flutter 中的数据", "code": 101,'arguments':''});
          },
          tooltip: 'Back',
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
