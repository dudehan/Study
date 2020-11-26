import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'basic_msg_channel.dart';
import 'event_channel.dart';

// void main() => runApp(MyApp());
void main() => runApp(_widgetForRoute(window.defaultRouteName));


Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':{
      print('route1 ======= ');


      return MyApp();
    }
    case 'route2':{
      print('route2 ======= ');
      return BasicMsgChannelDemo();
      // return null;
    }
    case 'route3':{
      print('route2 ======= ');
      return EventChannelDemo();
      // return null;
    }
    default:
      return Center(
        child: Text('Unknown route'),
      );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //传值给原生的通道
  static const methodChannel = const MethodChannel('com.flutterbus/demo');
  //注册监听原生通道
  EventChannel eventChannel = EventChannel('com.wx.eventChannel/demo');
  int _counter = 0;
  _iosPushToVC(String type) async {
    /** 包装成FlutterMethodCall对象，其中：
     * 参数一：函数名
     * 参数二：参数
    */
    Map param = {'type':type,'data':{'count':_counter}};
    await methodChannel.invokeMethod(type,param);
  }
  
  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_receiveFromeNative,onError: _fromNativeError);
  }
   //监听到数据后用于处理数据的方法，这个函数是用于处理接收到原生传进来的数据的，可自行定义（_eventSink(@(_count));）
  void _receiveFromeNative(Object para){
    print('para ============= $para');
    setState(() {
      _counter = para;
    });
  }
  void mytest() {
    print('接收到了：mytest ===== ');
  }
  //原生返回错误信息
  void _fromNativeError(Object error){
    print(error);
  }

  // Future setMethodChannelMethodHandle() async {
    Future<String> methodHandle(MethodCall call) async {
      print('nativeCallFlutter_result ====== ');
      return '回调结果';
    }
    
  // }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _iosPushToVC('type1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: (){
              _getMessageFromOC();
              // _iosPushToVC('exitFlutter');
            },
            child: Text('返回'),
            ),
            RaisedButton(onPressed: (){
              _iosPushToVC('type0');
            },
            child: Text('参数'),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _getMessageFromOC() async{

    try {
      Map param = {'type':'type3','data':{}};
      final String result = await methodChannel.invokeMethod('getFromOCClientMessage',param);
      print('_getMessageFromOC : $result');
      // methodChannel.setMethodCallHandler(methodHandle);
      methodChannel.setMethodCallHandler(methodHandle);
    } on PlatformException catch (e) {
      print(e.message);
    }

  }
}
