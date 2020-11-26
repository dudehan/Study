import 'package:flutter/material.dart';

class LCInheritedWidget extends InheritedWidget {
  final Widget child;
  final int counter;
  LCInheritedWidget({this.counter, Key key, this.child})
      : super(key: key, child: child);

  static LCInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(LCInheritedWidget oldWidget) {
    print("didChangeDependencies = ");
    return true;
  }
}

class LCInheritedDemo extends StatefulWidget {
  @override
  _LCInheritedDemoState createState() => _LCInheritedDemoState();
}

class _LCInheritedDemoState extends State<LCInheritedDemo> {
  int counter = 100;
  @override
  Widget build(BuildContext context) {
    print('xxxxx');
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: LCInheritedWidget(
          counter: counter,
          child: LCWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class LCWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    print('11111111111');
//    return Container();
    int counter = LCInheritedWidget.of(context).counter;
    return Container(
      child: Text('$counter'),
    );
  }
}
