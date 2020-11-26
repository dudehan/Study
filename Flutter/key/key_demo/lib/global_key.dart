import 'package:flutter/material.dart';

class GlobalKeyHomeDemo extends StatelessWidget {
  final GlobalKey<_GlobalKeyDemoState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: GlobalKeyDemo(key: _globalKey,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_globalKey.currentState.widget.bigName);
          print(_globalKey.currentState.name);
        },
        child: Icon(Icons.home),
      ),
    );
  }
}

class GlobalKeyDemo extends StatefulWidget {
  final String bigName = 'xxxx';
  GlobalKeyDemo({Key key}): super(key: key);
  @override
  _GlobalKeyDemoState createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {
  String name = 'jack';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}
