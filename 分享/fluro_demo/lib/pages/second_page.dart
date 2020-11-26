import 'package:fluro_demo/config/routes.dart';
import 'package:fluro_demo/pages/third_page.dart';
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

//    print('arguments ===== ${ModalRoute.of(context).settings.arguments}');

    return Scaffold(
        appBar: AppBar(
          title: Text('secondPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(p.name),
              Text(p.nickName),
              Text(p.age.toString()),
              Text(p.height.toString()),
              RaisedButton(
                onPressed: () {
                  Application.router.navigateTo(context, Routes.thirdPage);
//                  Navigator.of(context).pushNamed(Routes.thirdPage);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                  return ThirdPage();
                }));
                },
                child: Text('Navigate to thirdPage'),
              )
            ],
          ),
        ));
  }
}
