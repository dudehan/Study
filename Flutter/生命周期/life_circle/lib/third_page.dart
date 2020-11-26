
import 'package:flutter/material.dart';

//class ThirdPage extends StatelessWidget {
class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  @override
  void deactivate() {
    print('deactivate ==== ThirdPage');
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('third page'),),
    );
  }
}


