import 'package:flutter/material.dart';
import 'third_page.dart';
import 'application.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  int _count = 0;

  @override
  void initState() {
    print('initState :');
    super.initState();
  }

  @override
  void didUpdateWidget(SecondPage oldWidget) {
    print('did update Widget :');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    print('reassemble :');
    super.reassemble();
  }

  @override
  void deactivate() {
    bool isCurrent = ModalRoute.of(context).isCurrent;
    print('deactivate : isCurrent = $isCurrent');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose :');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('did change dependencies : ');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild ===== ');
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Test(),
            Text("$_count"),

            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) {
                    return ThirdPage();
                  }),
                );
              },
              child: Text('go to third page'),
            ),
            
            RaisedButton(onPressed: (){setState(() {
              _count++;
            });
            },
              child: Text('setState'),
            )
            
            
          ],
        ),
      ),
    );
  }
}


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  void didUpdateWidget(Test oldWidget) {
    print('test did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Text('测试');
  }
}

