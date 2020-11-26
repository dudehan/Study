import 'package:flutter/material.dart';
import 'models/foreground_model.dart';

class ForeGroundPaint extends CustomPainter {
  ForegroundModel model;

  ForeGroundPaint({this.model});

  @override
  void paint(Canvas canvas, Size size) {
//    print('== paint ==');
  if (model != null) {
    if (model.gestureType != GestureType.end) {
      Paint vLinePaint = Paint()
        ..color = Colors.red
        ..isAntiAlias = true //是否启动抗锯齿
        ..style = PaintingStyle.stroke //绘画风格，默认为填充
        ..strokeWidth = 1;
      canvas.drawLine(Offset(model.closest.dx, 0),
              Offset(model.closest.dx, size.height), vLinePaint);

      canvas.drawLine(Offset(0, model.closest.dy),
              Offset(size.width, model.closest.dy), vLinePaint);
    }
  }

  }

  @override
  bool shouldRepaint(ForeGroundPaint oldDelegate) {
//    print('=== shouldRepaint ===');
    return true;
  }
}
