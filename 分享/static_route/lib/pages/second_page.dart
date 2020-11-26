import 'package:flutter/material.dart';
import 'package:static_route/routers/router.dart';
import 'third_page.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.name;
    print('SecondPage : build');
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SecondPage'),
            RaisedButton(
              onPressed: () {
//                Navigator.of(context).popUntil((route) => \)
                Navigator.of(context).pushNamed(RoutePath.thirdPage,
                    arguments: {
                      'message': 'message from second page',
                      'value': 'value from second page'
                    });

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) {
                    return ThirdPage();
                  },
                  settings: RouteSettings(
                      name: RoutePath.thirdPage,
                      arguments: {
                        'message': 'message from second page',
                        'value': 'value from second page'
                      }),
                ));
              },
              child: Text('go to third page'),
            )
          ],
        ),
      ),
    );
  }
}
