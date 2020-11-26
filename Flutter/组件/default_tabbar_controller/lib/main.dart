import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text('xx')),
        body: Column(
          children: <Widget>[
            _appBarBottomDemo()
          ],
        ),
      ),
    );
  }

  Widget _appBarBottomDemo() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (int index) {
                print('Selected......$index');
              },
              tabs: [
                Text(
                  '精选',
                  style: TextStyle(color: Colors.green, fontSize: 16.0),
                ),
                Text(
                  '猜你喜欢',
                  style: TextStyle(color: Colors.indigoAccent, fontSize: 16.0),
                ),
              ]),
        ),
        body: TabBarView(children: [
          Text('精选'),
          Text('猜你喜欢'),
        ]),
      ),
      // ),
    );
  }
}
