import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class RotationAnimationDemo extends StatefulWidget {
  @override
  _RotationAnimationDemoState createState() => _RotationAnimationDemoState();
}

class _RotationAnimationDemoState extends State<RotationAnimationDemo>
    with SingleTickerProviderStateMixin {
  List<Offset> offsetList = [];
  List<double> radiusList = [];
  // Animation _animation;
  AnimationController _controller;

  Timer timer;
  int duration = 3;
  int step = 0;
  int repeatCount = 0;
  @override
  void initState() {
    super.initState();
    test();
    _controller =
        AnimationController(duration: Duration(seconds: duration), vsync: this);
    _controller.repeat();

    this.timer = Timer.periodic(Duration(milliseconds: 80), (timer) {
      int totalCount = duration * 1000 ~/ 80;
      int apperDuration = totalCount ~/ 12;
      step += 1;
      if (step == totalCount) {
        step = 0;
        // repeatCount += 1;
      }

      setState(() {


      

        for (int i = 0; i < 12; i++) {
          int tem = step - i * totalCount ~/ 12;
          if (step > 0) {
            radiusList[i] = (tem * 0.5).toDouble();
          } else {
            radiusList[i] = 0;
          }
        }

        // for (int i = 0; i < 12; i++) {
        //   // radiusList[i] = (20 - step * 0.5).toDouble();
        //   double result = (20 - step * 0.5).toDouble();
        //   if (result <= 0) {
        //     result = 0;
        //   }
        //   radiusList[i] = result;
        // }
      });
    });
  }

  void test() {
    for (int i = 0; i < 12; i++) {
      double rad = (pi * 2 / 12) * (i + 1);

      Offset offset = Offset(100 + sin(rad) * 100, 100 - cos(rad) * 100);
      offsetList.add(offset);
      // double radius = (1 - 30 * i / 360) * 19 + 1;
      // radiusList.add(radius);
      radiusList.add(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.white,

        // child: ScaleTransition(
        //   scale: Tween<double>(begin: 0.7, end: 1.0).animate(
        //     CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
        //   ),
        // alignment: Alignment.center,
        child: RotationTransition(
          turns: _controller,
          // child: Container(),
          child: CustomPaint(
            foregroundPainter: MyPainter(this.offsetList, this.radiusList),
            child: Container(),
          ),
          // ),
        ),
      ),
    );
  }
}

// class MyPainter extends CustomPainter {
//   List<Offset> offsetList = [];
//   // List<double> radiusList = [];
//   double radius = 10;

//   MyPainter(this.offsetList, this.radius);
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     // for (int i = 0; i < offsetList.length; i++) {
//     //   canvas.drawCircle(offsetList[i], radiusList[radiusList.length - i -1], paint);
//     // }
//     canvas.drawCircle(offsetList[0], radius, paint);
//   }

class MyPainter extends CustomPainter {
  List<Offset> offsetList = [];
  List<double> radiusList = [];

  MyPainter(this.offsetList, this.radiusList);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    for (int i = 0; i < offsetList.length; i++) {
      canvas.drawCircle(
          offsetList[i], radiusList[radiusList.length - i - 1], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
