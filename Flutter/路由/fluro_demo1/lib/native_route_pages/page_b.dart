import 'package:flutter/material.dart';
import 'page_c.dart';

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('pageB'),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (build){
              return PageC();
            }));

          },
          child: Text('xxx'),
        ),
      ),
    );
  }
}