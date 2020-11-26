import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    FlutterBoost.singleton.addBoostContainerLifeCycleObserver((ContainerLifeCycle state, BoostContainerSettings settings) {

      print('firstPage ContainerLifeCycle : $state');
      switch (state) {
        case ContainerLifeCycle.Appear:
          break;
        default:
      }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'),),
      body: Center(
        child: Text('flutter'),
      ),
    );
  }
}