import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: StreamDemo(),
          ),
        ),
    );
  }
}


class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  final StreamController _controller = StreamController();
  StreamSubscription _subscription;

  int count = 0;
  @override
  void initState() {
    _controller.stream.listen((event) {
      print('event === $event');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: (){
          _controller.sink.add(count ++);
        },
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.close();
    super.dispose();
  }
}




