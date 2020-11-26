import 'package:flutter/material.dart';
import 'listen_inject.dart';

class ThirdPage extends StatefulWidget{
    @override
    _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends LCState<ThirdPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('second page'),),
            body: Center(
                child: RaisedButton(
                    onPressed: (){
//                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
//                            return ThirdPage();
//                        }));
                    },
                    child: Text('按钮'),
                ),
            ),
        );
    }
}
