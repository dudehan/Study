import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class Demo2 extends StatefulWidget {
  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  double r = 5;
  double w = 10;
  double moveSize = 5;
  double numOfMoveView = 1;
  double moveViewSize = 5;

  List<Offset> offsetList = [];
  List<double> radiusList = [];

  List radianList = [];

  double height = 200;
  double width = 200;

  Timer timer;
  double limbCount = 0;
  int count = 0;

  Offset offset;
  double radius;

  @override
  void initState() {
    super.initState();
    int duration = 5;
    int i = 0;
    double stepSize = 0.5;
    this.timer = Timer.periodic(Duration(milliseconds: duration), (timer) {
      setState(() {
        double count = 360/stepSize;
        if (i == 360/stepSize) i = 0;
        i++;
        double rad = (pi * 2 / count) * i;
        offset = Offset(100 + sin(rad) * 100, 100 - cos(rad) * 100);
        // radius = (1 - 1 * i / count) * 9 + 1;
        radius = 5;
      });
    });
  }

  void timerCircle() {
    int duration = 200;
    int i = 0;
    this.timer = Timer.periodic(Duration(milliseconds: duration), (timer) {
      setState(() {
        if (i == 36) i = 0;
        i++;
        double rad = (pi * 2 / 36) * i;
        offset = Offset(100 + sin(rad) * 100, 100 - cos(rad) * 100);
        radius = (1 - 10 * i / 360) * 9 + 1;
      });
    });
  }

  // void test() {
  //   for (int i = 0; i < 12; i++) {
  //     double rad = (pi * 2 / 12) * (i + 1);

  //     Offset offset = Offset(100 + sin(rad) * 100, 100 - cos(rad) * 100);

  //     print('rad ==== $rad');
  //     print('sin : ${sin(rad)} ========== cos : ${cos(rad)}');
  //     print('x : ${offset.dx} ========== y : ${offset.dy}');
  //     offsetList.add(offset);

  //     double radius = (1 - 30 * i / 360) * 9 + 1;
  //     radiusList.add(radius);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myTitle'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
          child: Center(
            child: CustomPaint(
          // foregroundPainter: MyPainter(offsetList, radiusList),
              foregroundPainter: MyCirclePainter(offset, radius),
              child: Container(width: 200, height: 200,),
        ),
          ),
        ),
        
      ),
    );
  }
}

class MyCirclePainter extends CustomPainter {
  Offset offset;
  double radius;

  MyCirclePainter(this.offset, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(this.offset, radius, paint);
  }

  @override
  bool shouldRepaint(MyCirclePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyCirclePainter oldDelegate) => false;
}

class MyPainter extends CustomPainter {
  List<Offset> offsetList = [];
  List<double> radiusList = [];

  MyPainter(this.offsetList, this.radiusList);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (int i = 0; i < this.offsetList.length; i++) {
      // canvas.drawCircle(Offset(150, 100*(1 -  cos(pi * 2 / 12))), radiusList[i], paint);
      canvas.drawCircle(this.offsetList[i], radiusList[i], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
