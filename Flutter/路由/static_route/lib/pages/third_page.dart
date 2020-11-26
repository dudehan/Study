import 'package:flutter/material.dart';

import 'package:static_route/routers/router.dart';


class ThirdPage extends StatefulWidget {

  final String message;
  final String value;

  ThirdPage({this.message, this.value});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {

    print('thirdPage : build');
    return Scaffold(
      appBar: AppBar(
        title: Text('ThirdPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LCText(),
            Text('message == ${widget.message}'),
            Text('value   == ${widget.message}'),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).popUntil(ModalRoute.withName(RoutePath.homePage));
                Navigator.of(context).pushNamedAndRemoveUntil(RoutePath.fourPage, (route) => false);
              },
              child: Text('back to first page'),
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
