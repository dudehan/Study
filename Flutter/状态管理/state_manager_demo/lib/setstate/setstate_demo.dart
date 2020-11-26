import 'package:flutter/material.dart';

class SetStateDemo extends StatefulWidget {
  @override
  _SetStateDemoState createState() => _SetStateDemoState();
}

class _SetStateDemoState extends State<SetStateDemo> {
  Color color = Colors.red;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SetState'),
      ),
      body: Container(
        width: 400,
        height: 400,
        color: color,
        // child: WidgetA(Colors.red,this.count),
        child: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                return Column(
                  children: <Widget>[
                    WidgetA(Colors.red, this.count),
                    RaisedButton(
                      onPressed: () {
                        // setState(() {
                        //   print('object');
                        // });
                        (context as Element).markNeedsBuild();
                      },
                      child: Text('button'),
                    )
                  ],
                );
                // return RaisedButton(
                //   onPressed: () {
                //     // setState(() {
                //     //   print('object');
                //     // });
                //     (context as Element).markNeedsBuild();
                //   },
                //   child: Text('button'),
                // );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // color = Colors.blue;
            // count ++;
            // print('=========');
          });
        },
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  final Color color;
  int count;
  WidgetA(this.color, this.count);
  @override
  Widget build(BuildContext context) {
    print('WidgetA build ======= ');
    return Container(
      width: 300,
      height: 300,
      color: color,
      // child: Text(count.toString()),
      child: Center(
        child: Column(
          children: <Widget>[
            // Text(count.toString()),
            WidgetB(this.color, this.count),
            WidgetC()
          ],
        ),
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  final Color color;
  int count;
  WidgetB(this.color, this.count);

  @override
  Widget build(BuildContext context) {
    print('WidgetB build ======= ');
    return Container(
      width: 200,
      height: 200,
      color: color,
      child: Text('count.toString()'),
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetC build ======= ');
    return Container(
      child: Text('xxxxx'),
    );
  }
}
