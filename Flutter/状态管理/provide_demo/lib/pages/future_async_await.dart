
import 'package:flutter/material.dart';

class FutureDemo extends StatefulWidget {
  @override
  _FutureDemoState createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('$_count'),
          RaisedButton(onPressed: (){
            setState(() {
              _count++;
            });
          })
        ],
      ),
    );
  }

  



}