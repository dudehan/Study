import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/k_line_model.dart';
import 'providers/k_line_provider.dart';

class LCKlinePainter extends CustomPainter {
  List<KLinePoint> points;
  double paddingTop = 15;
  double paddingBottom = 15;

  LCKlinePainter({this.points});

//  KLineModel model = Provider.of<KLineProvider>(ctx).kLineModel;

  @override
  void paint(Canvas canvas, Size size) {
//    print('=== LCKlinePainter ===');

    ///点数
    int pointCounts = points.length;
    ///单位宽
    double unitWidth = size.width / (pointCounts - 1);
    ///最大最小值
    List minMax = _calculatorMinMax();
    double minValue = minMax[0];
    double maxValue = minMax[1];
    double firstPoint = points[0].instrumentPL;
    double height = size.height - paddingBottom - paddingTop;
    double maxDif =
        max((firstPoint - maxValue).abs(), (firstPoint - minValue).abs());
    double difValue = maxDif * 2;
    double scale = height / difValue;

    ///折线
    Paint linePaint = Paint()
      ..color = Color.fromRGBO(0, 160, 255, 1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    ///填充
    Paint fillPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    List<Color> fillColors = [Color.fromRGBO(0, 160, 255, 0.22), Color.fromRGBO(0, 160, 255, 0)];
    Shader mLineFillShader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      colors: fillColors,
    ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
    fillPaint.shader = mLineFillShader;

    Path linePath = Path();
    Path fillPath = Path();

    for (int i = 0; i < points.length; i++) {
      double curX = (i * unitWidth).toDouble();
      double curY = (points[i].instrumentPL - firstPoint) * scale;
      curY = size.height / 2 - curY;

      if (i == 0) {
        linePath.moveTo(curX, curY);
        fillPath.moveTo(curX, size.height);
        fillPath.lineTo(curX, curY);
      } else {
        linePath.lineTo(curX, curY);
        fillPath.lineTo(curX, curY);
        if (i == points.length - 1) {
          fillPath.lineTo(curX, size.height);
        }
      }
    }

    fillPath.close();
    canvas.drawPath(fillPath, fillPaint);
    fillPath.reset();
    canvas.drawPath(linePath, linePaint);
    linePath.reset();
    ///绘制虚线
    _drawDashLine(canvas, size);
  }

  ///绘制虚线
  _drawDashLine(Canvas canvas, Size size) {
    Paint dashLinePaint = Paint()
      ..strokeWidth = 2
      ..isAntiAlias = true // 是否抗锯齿
      ..color=Color.fromRGBO(215, 215, 215, 1); // 画笔颜色

    var dashWidth = 5;
    var dashSpace = 5;
    double startX = 0;
    final space = (dashSpace + dashWidth);

    while(startX < size.width) {
      canvas.drawLine(Offset(startX, size.height/2), Offset(startX + dashWidth, size.height/2), dashLinePaint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


  _calculatorMinMax() {
    if (points.isEmpty) {
      return;
    }
    double max = points[0].instrumentPL;
    double min = points[0].instrumentPL;
    for (KLinePoint p in points) {
      double y = p.instrumentPL;
      if (y > max) {
        max = y;
      }
      if (y < min) {
        min = y;
      }
    }
    return [min, max];
  }
//  _calculatorMinMax() {
//    if (points.isEmpty) {
//      return;
//    }
//    double max = points[0];
//    double min = points[0];
//    for (double y in points) {
//      if (y > max) {
//        max = y;
//      }
//      if (y < min) {
//        min = y;
//      }
//    }
//    return [min, max];
//  }
}
