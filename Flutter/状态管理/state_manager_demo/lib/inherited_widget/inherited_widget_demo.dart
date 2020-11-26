import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class FatherWidget extends InheritedWidget {
  final int data;

  FatherWidget({@required this.data, Widget child}) : super(child: child);

  //子树通过该方法获取共享数据
  static FatherWidget getData(BuildContext context) {
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变（updateShouldNotify返回true）时会被调用
    //如果build中没有依赖InheritedWidget,则此回调不会被调用
    print("didChangeDependencies = " +
        FatherWidget.getData(context).data.toString());
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
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('title'),
        ),
        body: new Center(
//          child: FatherWidget(
//            data: count,
//            child: new Column(
//              children: <Widget>[
//                ChildWidget(),
//                new FloatingActionButton(onPressed: _changeCount,child: new Icon(Icons.adjust),),
//              ],
//            ),
//          ),
        ),
      ),
    );
  }

  _changeCount() {
    setState(() {
      ++count;
      print('mCount == ' + count.toString());
    });
  }
}