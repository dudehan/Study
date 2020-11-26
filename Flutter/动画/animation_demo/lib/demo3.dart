import 'package:flutter/material.dart';

class RotationAnimationDemo extends StatefulWidget {
  @override
  _RotationAnimationDemoState createState() => _RotationAnimationDemoState();
}

class _RotationAnimationDemoState extends State<RotationAnimationDemo>
    with TickerProviderStateMixin {
  // Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("status is completed");
        _controller.reset();
        //开启
        _controller.forward();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is dismissed");
        //controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.white,
        child: RotationTransition(
          turns: _controller,
          child: CustomPaint(
            foregroundPainter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(50, 50), 5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
