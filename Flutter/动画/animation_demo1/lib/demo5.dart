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

  Timer timer;
  int pointCount = 5;     ///小球个数
  int radiusStep = 5;     ///步进，定时器每次唤醒球球前进角度
  int oneCircleStep = 0;  ///计数，当前已走多少步
  int circleNum = 0;      ///跑了几圈，最后一个小球走完为两圈
  int circleR = 50;       ///动画小球旋转半径
  int pointCircle = 15;
  @override
  void initState() {
    super.initState();
    test();

    this.timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      ///计算总共走了多少圈
      if (oneCircleStep < 360) {
        oneCircleStep += radiusStep;
      } else {
        oneCircleStep = 0;
        if (circleNum < 1) {
          circleNum++;
        } else {
          circleNum = 0;
        }
      }

      setState(() {
        List<Offset> oList = [];
        List<double> rList = [];
        for (int i = 0; i < pointCount; i++) {
          ///offset
          Offset offset;
          double tmpRadius;
          double rad = (pi * 2 * oneCircleStep / 360);
          ///和第一个球球保持延时出现：推迟 i*(360 / pointCount）步
          double tempCount = oneCircleStep - i * (360 / pointCount);
          
          if (circleNum < 1) {
            if (tempCount > 0) {
              rad = (pi * 2 * tempCount / 360) ;
              tmpRadius = (tempCount / 360)  * 15;
            } else {
              rad = 0;
              tmpRadius = 0;
            }
          } else {
            int ago = oneCircleStep ~/ (360 / pointCount) + 1;
            ///判断是否走满一圈
            if (i < ago) {
              ///走满一圈角度为0，等待后面的球球
              rad = 0;
              tmpRadius = 15;
            } else {
              // int aSpeed = 0; 
              ///未走满一圈继续走
              tempCount = ((pointCount - i)*(360 / pointCount) + oneCircleStep);
              rad = (pi * 2 * tempCount / 360 );
              tmpRadius = (tempCount / 360)  * 15;
            }
          }
          offset = Offset(100 + sin(rad) * circleR, 100 - cos(rad) * circleR);          

          oList.add(offset);
          rList.add(tmpRadius);
        }
        offsetList = oList;
        // radiusList = rList;
      });
    });
  }

  void test() {
    for (int i = 0; i < 12; i++) {
      double rad = (pi * 2 / 12) * (i + 1);

      Offset offset = Offset(100 + sin(rad) * circleR, 100 - cos(rad) * circleR);
      offsetList.add(offset);
      // double radius = (1 - 30 * i / 360) * 19 + 1;
      // radiusList.add(radius);
      if (i == 0) {
        radiusList.add(7);
      } else {
        radiusList.add(5);
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.white,
        child: CustomPaint(
          foregroundPainter: MyPainter(this.offsetList, this.radiusList),
          child: Container(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  List<Offset> offsetList = [];
  List<double> radiusList = [];

  MyPainter(this.offsetList, this.radiusList);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int i = 0; i < offsetList.length; i++) {
      canvas.drawCircle(
          offsetList[i], radiusList[i], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
