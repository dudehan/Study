import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
    final Header header;
    
    TestDemo({this.header});
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            header(Offset(100, 100)),
            RaisedButton(
            ),

        ],

        
    );
  }
}

typedef Header = Widget Function(Offset offset);
