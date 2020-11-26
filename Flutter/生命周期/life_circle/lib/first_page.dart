import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void deactivate() {
    print('deactivate : FirstPage');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('first page')),
      body: Container(
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return SecondPage();
              }));
            },
            child: Text('go to second page'),
          ),
        ),
      ),
    );
  }
}
