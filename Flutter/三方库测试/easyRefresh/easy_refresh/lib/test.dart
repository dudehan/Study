import 'package:flutter/material.dart';


class XXX extends StatelessWidget {
  MyDemo d = MyDemo(c:100);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class MyDemo {

  final int count;
  MyDemo({int c}):this.count = c ?? 10;

}