import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../route_bridge.dart';

class ThirdPage extends StatefulWidget {

  final String message;
  final String value;

  ThirdPage({this.message, this.value});


  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  @override
  void dispose() {
    print('thirdPage ==== dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ThirdPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            LCText(),
            Text('message == ${widget.message}'),
            Text('value   == ${widget.value}'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/pageD');
              },
              child: Text('go to pageD'),
            )
          ],
        ),
      ),
    );
  }
}

class LCText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments;
    var name = ModalRoute.of(context).settings.name;
    print('ThirdPage === $arguments; name == $name');

    return Column(
      children: <Widget>[
        Text('name : $name'),
        Text('arguments == $arguments')
      ],
    );
  }
}
