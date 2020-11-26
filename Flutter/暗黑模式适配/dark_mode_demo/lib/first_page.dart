import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'event_bus.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'fit/size_fit.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    lcEventBus.on<ThemeModel>().listen((value){
//      print('isDark ==== ${value.isDark}');
//      setState(() {
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    print('first rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
//            Consumer<LCThemeProvider>(
//              builder: (ctx,model,child){
//                return Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 100,
//                  ///此container单独设置了颜色，不会随着light和dark模式自动切换颜色，
//                  ///从后台切换到前台时也不会重新调用build刷新，
//                  ///所以不能通过MediaQuery.of(context).platformBrightness获取当前模式进行刷新
//                  ///此时如果你在不同模式下需要不同的背景色则需要对模式切换进行监听
//                  color: model.isDark ? Colors.green : Colors.yellow,
////                  color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.green : Colors.yellow,
////              color: Colors.green,
//                  child: Center(child: Text('这是一个container')),
//                );
//              },
               Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                ///此container单独设置了颜色，不会随着light和dark模式自动切换颜色，
                ///从后台切换到前台时也不会重新调用build刷新，
                ///所以不能通过MediaQuery.of(context).platformBrightness获取当前模式进行刷新
                ///此时如果你在不同模式下需要不同的背景色则需要对模式切换进行监听
                  color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.green : Colors.yellow,
//              color: Colors.green,
                child: Center(child: Text('这是一个container')),
              ),
//            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Opacity(opacity: 0.3, child: Text('data')),
                    Divider(),
                    Text('Hello world'),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(onPressed: () {}, child: Text('FlatButton')),
                RaisedButton(onPressed: () {}, child: Text('RaisedButton')),
              ],
            ),
            Card(
              child: ListTile(
                title: Text('ListTile'),
                subtitle: Text('subTitle'),
                leading: Icon(Icons.alarm),
                trailing: Icon(Icons.add),
                onTap: () {},
              ),
            ),
            RaisedButton(child: Text('raisedButton'), onPressed: () {}),
            InkWell(
              child: Container(
                  width: 200,
                  height: 30,
                  child: Center(child: Text('inkwell'))),
              onTap: () {},
            ),
            Expanded(
              child: ListView(children: <Widget>[
                ListTile(
                  title: Text('ListTile'),
                  subtitle: Text('subTitle'),
                  leading: Icon(Icons.alarm),
                  trailing: Icon(Icons.add),
                )
              ]),
            ),
            TextField(),
            Icon(Icons.map)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
//        bottomNavigationBar: BottomAppBar(
//          child: Row(
//            //里边可以放置大部分Widget，让我们随心所欲的设计底栏
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              IconButton(
//                icon: Icon(Icons.home),
//                onPressed: () {},
//              ),
//              IconButton(icon: Icon(Icons.access_alarms), onPressed: () {}),
//            ],
//          ),
//        )
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
        BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类'))
      ]),
    );
  }
}
