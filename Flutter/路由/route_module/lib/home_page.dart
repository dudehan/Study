import 'package:flutter/material.dart';
//import 'module_A/first_page.dart';

import 'route_bridge.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    print('HomePage : build');
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/firstPage');
              },
              child: Text('go to first page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/qqq');
              },
              child: Text('go to qqq'),
            )
          ],
        ),
      ),
    );
  }
}
