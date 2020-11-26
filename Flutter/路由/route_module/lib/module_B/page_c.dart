
import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageC'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (builder) {
              //   return PageD();
              // }), (route) => true);
              // Navigator.of(context).popUntil()
              Navigator.of(context).pushNamed('/thirdPage',arguments: {'message':'message From pageC','value':'模块跳转传参测试'});
            },
            child: Text('go to thirdPage'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/pageA'));
            },
            child: Text('back to pageA'),
          ),
        ],
      )),
    );
  }
}
