import 'package:fluro_demo/config/routes.dart';
import 'package:flutter/material.dart';
import '../config/application.dart';
import '../models/person.dart';
import 'dart:convert';

class SecondPage extends StatefulWidget {
  String name;
  String nickName;
  int age;
  double height;
  final String jsonString;

  SecondPage(
      {this.name, this.nickName, this.age, this.height, this.jsonString});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var list = List<int>();

    ///字符串解码
    jsonDecode(widget.jsonString).forEach(list.add);
    final String value = Utf8Decoder().convert(list);
    var data = json.decode(value);
    Person p = Person.fromJson(data);

    return Scaffold(
        appBar: AppBar(
          title: Text('secondpage'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Text(p.name),
              Text(p.nickName),
              Text(p.age.toString()),
              Text(p.height.toString()),
              RaisedButton(
                onPressed: () {
                  Application.router.printTree();
                  Application.router.navigateTo(context, '/1thirdPage');
                },
                child: Text('navigate to thirdPage'),
              )
            ],
          ),
        ));
  }
}
