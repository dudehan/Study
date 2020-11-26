import 'package:flutter/material.dart';
import 'third_page.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    print('build : secondPage');
    return Scaffold(
        appBar: AppBar(
            title: Text('secondPage'),
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                    RaisedButton(
                        onPressed: () {
                            Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                return ThirdPage();
                            }));
                        },
                        child: Text('to ThirdPage'),
                    ),
                    Text('errorId')
                ],
            ),
        ),
    );
  }
}
