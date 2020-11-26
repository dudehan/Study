import 'package:flutter/material.dart';
import 'second_page.dart';
import 'listen_inject.dart';

import 'lc_event_bus.dart';



class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends LCState<FirstPage> {

  @override
  void initState() {

//    LCEventBus.manager().fire(() {
//      print('xxxx');
//    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {

            LCEventBus.manager().fire('first Page');

//            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
//              return SecondPage();
//            }));
          },
          child: Text('按钮'),
        ),
      ),
    );
  }
}
