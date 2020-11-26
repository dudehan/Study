import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  final String name;
  final int age;
  FirstPage({this.name,this.age});
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    print('FirstPage : build');
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(''),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/pageA');
              },
              child: Text('go to second page'),
            )
          ],
        ),
      ),
    );
  }
}
