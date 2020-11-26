import 'package:flutter/material.dart';
import 'page_b.dart';

class PageA extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    print('******************');
    return Scaffold(
      appBar: AppBar(title: Text('pageA'),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/pageB');
          },
          child: Text('go to pageB'),
        ),
      ),
    );
  }
}
