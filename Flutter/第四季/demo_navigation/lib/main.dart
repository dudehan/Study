// import 'dart:html';

import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(

    title: "导航栏",
    home: new FirstScreen()
  )
  );


}

class FirstScreen extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar:AppBar(
        title: Text('title'),
      ),
      body:Center(
        child: RaisedButton(
          child: Text('按钮'),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(
              // builder: (context) => SecondScreen('返回'))
              builder: (context) => SecondScreen.withName('返回111'))
            );
          },
        ),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {

  String name;
  SecondScreen(this.name);
  SecondScreen.withName(this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(title:Text(name)),
      body:Center(
        child:RaisedButton(
          child:Text(name),
          onPressed:(){Navigator.pop(context);},
        )
      )
    );
  }
}


