import 'package:flutter/material.dart';
import './inherited_widget/inherited_demo2.dart';

void main() => runApp(MyApp());

class FatherWidget extends InheritedWidget {
  final int data;

  FatherWidget({@required this.data, Widget child}) : super(child: child);

  //子树通过该方法获取共享数据
  static FatherWidget getData(BuildContext context) {
    // return context.inheritFromWidgetOfExactType(FatherWidget);
    return context.dependOnInheritedWidgetOfExactType();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的widget
  @override
  bool updateShouldNotify(FatherWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class ChildWidget extends StatefulWidget {
  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return new Text(FatherWidget.getData(context).data.toString());
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      home: LCInheritedDemo()
    );
  }
}

//class Person {
//  void test() {
//    run.call('');
//  }
//  void run(String name) {
//  }
//}
//
//mixin NewPerson on Person {
//  String nickName;
//}
//
//void test() {
//  Person p = Person();
////  NewPerson p = Person() as NewPerson;
//  //  p.run(name);
//  var p1 = p as NewPerson;
//  p1.nickName = 'x';
//
//}

abstract class LCImp {
  void run(){}
}

class LCBasic {

}

class LCTest extends LCBasic implements LCImp {
  @override
  void run() {
    print('run');
  }
}

class Test {

  LCBasic lcBasic = LCBasic();
//  var l2 = lcBasic as LCImp;

}



