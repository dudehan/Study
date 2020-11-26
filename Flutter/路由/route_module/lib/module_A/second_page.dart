import 'package:flutter/material.dart';
import 'third_page.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void dispose() {
    print('SecondPage ==== dispose');
    super.dispose();
  }
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

//                Navigator.of(context).push(MaterialPageRoute(
//                  builder: (ctx) {
//                    return ThirdPage(value: 'value from second page',message: 'message from second page',);
//                  },
//                ));
                  Navigator.of(context).pushNamed('/pageC');
              },
              child: Text('go to pageC'),
            )
          ],
        ),
      ),
    );
  }
}
