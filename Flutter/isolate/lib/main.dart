import 'package:flutter/material.dart';
import 'first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Demo(),
    );
  }
}
class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
              return FirstPage();
            }));
          },
          child: Text('按钮'),
        ),
      ),
    );
  }
}