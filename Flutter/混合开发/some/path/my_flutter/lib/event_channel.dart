import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelDemo extends StatefulWidget {
  @override
  _EventChannelDemoState createState() => _EventChannelDemoState();
}

class _EventChannelDemoState extends State<EventChannelDemo> {
  String title = 'flutter - eventChannel';
  int _counter = 0;
  //注册监听原生通道
  EventChannel eventChannel = EventChannel('com.wx.eventChannel/demo');
  @override
  void initState() {
    eventChannel.receiveBroadcastStream().listen(_receiveFromeNative,onError: _fromNativeError);
    super.initState();
  }
  void _receiveFromeNative(Object para){
    print('para ============= $para');
    setState(() {
      _counter = para;
    });
  }
  //原生返回错误信息
  void _fromNativeError(Object error){
    print(error);
  }

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }
  _backToNative() async{
    // await eventChannel
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
          child: Column(
            children: [
              Text(_counter.toString()),
              RaisedButton(onPressed: _incrementCounter),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _backToNative,
          tooltip: 'Back',
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
