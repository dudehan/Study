import 'package:flutter/material.dart';
import 'page_d.dart';

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<NavigatorObserver> observers = Navigator.of(context).widget.observers;
    print('Pagec ===== ${observers.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text('PageC'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (build) => PageD()));
          },
          child: Text('navigate to D'),
        ),
      ),
    );
  }
}
