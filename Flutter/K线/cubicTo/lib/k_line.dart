import 'dart:math';

import 'package:flutter/material.dart';

class LCKlinePainter extends CustomPainter {
  // List<Point<double>> points = [];
  List<Point<double>> points = [];

  LCKlinePainter(this.points);

  Rect rect1 = Rect.fromLTRB(0, 100, 0, 50);
  Rect rect2 = Rect.fromLTRB(0, 150, 0, 50);

  @override
  void paint(Canvas canvas, Size size) {

    ///折线
    Paint linePaint = Paint()
      ..color = Color.fromRGBO(0, 160, 255, 1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    ///填充
    Paint fillPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    List<Color> fillColors = [
      Color.fromRGBO(0, 160, 255, 0.22),
      Color.fromRGBO(0, 160, 255, 0)
    ];
    Shader mLineFillShader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      colors: fillColors,
    ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
    fillPaint.shader = mLineFillShader;

    Path linePath = Path();
    Path fillPath = Path();
    linePath.moveTo(points[0].x.toDouble(), points[0].y.toDouble());
    for (int i = 1; i < points.length; i++) {
      Point last = points[i - 1];
      Point cur = points[i];

      linePath.moveTo(last.x, last.y);
      linePath.cubicTo((last.x + cur.x) / 2, last.y, (last.x + cur.x) / 2,
          last.y, cur.x, cur.y);
      print((last.x + cur.x) / 2);
      print((last.x + cur.x) / 2);
      canvas.drawPath(linePath, linePaint..color = Colors.blue);
      linePath.reset();

      fillPath.moveTo(last.x.toDouble(), 150.0);
      fillPath.lineTo(last.x.toDouble(), last.y.toDouble());
      fillPath.cubicTo((last.x + cur.x) / 2, last.y, (last.x + cur.x) / 2,
          last.y, cur.x, cur.y);
      fillPath.lineTo(cur.x, 150.0);

      fillPath.close();
      canvas.drawPath(fillPath, fillPaint);
      fillPath.reset();

      // 绘制矩形
      final Paint chartPaint = Paint()
          ..isAntiAlias = true
          ..filterQuality = FilterQuality.high
          ..strokeWidth = 1.0
          ..color = Colors.red;

      canvas.drawRect(Rect.fromLTRB(cur.x - 3, cur.y + 100, cur.x + 3, 150),
              chartPaint..color = cur.y < last.y ? Colors.red : Colors.green);
      // canvas.drawRect(Rect.fromLTRB(last.x , cur.y + 100, cur.x , 150),
      //         chartPaint..color = cur.y < last.y ? Colors.red : Colors.green);
      last = points[i - 1];
      cur = points[i];

      linePath.moveTo(last.x, last.y + 200);
      linePath.cubicTo((last.x + cur.x) / 2, last.y + 200, (last.x + cur.x) / 2,
              last.y + 200, cur.x, cur.y + 200);
      canvas.drawPath(linePath, linePaint..color = Colors.grey);
      linePath.reset();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
