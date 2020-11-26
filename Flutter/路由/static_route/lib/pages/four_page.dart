import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  @override
  _FourPageState createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('fourPage'),),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text(''),
                    RaisedButton(
                        onPressed: () {
                        },
                        child: Text('fourPage'),
                    )
                ],
            ),
        ),
    );
  }
}
