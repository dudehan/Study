import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          Container(
            color: Colors.blue,
          ),
          Row(children: [
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.red,
            )
          ],)


        ]
      ),
      
      


    );
  }
}