import 'package:flutter/material.dart';
import 'package:mixinonimplements/third_page.dart';
import 'listen_inject.dart';
import 'third_page.dart';

class SecondPage extends StatefulWidget{
    @override
    _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends LCState<SecondPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('second page'),),
            body: Center(
                child: RaisedButton(
                    onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                            return ThirdPage();
                        }));
                    },
                    child: Text('按钮'),
                ),
            ),
        );
    }
}
