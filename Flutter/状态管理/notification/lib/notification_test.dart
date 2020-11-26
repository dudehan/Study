import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  String _msg = 'xzx';

  onReceiveMessage(String message) {
    print('xxxxxxx');
    setState(() {
      _msg = message;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_msg)),
        body: NotificationListener<LCNotification>(
          child: Center(
            child: Child(),
          ),
          onNotification: (notification) {
            onReceiveMessage(notification.infoString);
            return true;
          },
        ));
  }
}

class Child extends StatefulWidget {
  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          LCNotification('child来上报数据里').dispatch(context);
        },
        child: Text('上报数据'),
      ),
    );
  }
}

class LCNotification extends Notification {
  String infoString;

  LCNotification(this.infoString);
}
