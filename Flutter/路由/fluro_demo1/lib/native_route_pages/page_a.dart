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
            Navigator.push(context, MaterialPageRoute(builder: (build){
              return PageB();
            }));
          },
          child: Text('xxx'),
        ),
      ),
    );
  }
}
