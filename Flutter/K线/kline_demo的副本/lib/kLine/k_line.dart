import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/k_line_model.dart';
import 'providers/k_line_provider.dart';


class LCKlinePainter extends CustomPainter {

  List points;
  double paddingTop = 0;
  double paddingBottom = 0;

  LCKlinePainter(this.points);
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
    double min = minMax[0];
    double max = minMax[1];
//    double centerY =
    double firstPoint = points[0];
    double height = size.height - paddingBottom - paddingTop;

    double dif = ((height / 2) - min).abs() - ((height / 2) - max).abs();


    double difValue = max - min;




    ///单位高
    double unitHeight = size.height / difValue;

    ///折线
    Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    ///填充
    Paint fillPaint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    List<Color> fillColors = [Colors.yellow, Colors.blue];
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
//      double curY = size.height - points[i];
      double curY = (points[i] - min) /
              difValue *
              (size.height - paddingTop - paddingBottom) +
              paddingTop;
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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


  _calculatorMinMax() {
    if (points.isEmpty) {
      return;
    }
    double max = points[0];
    double min = points[0];
    for (double y in points) {
      if (y > max) {
        max = y;
      }
      if (y < min) {
        min = y;
      }
    }
    return [min, max];
  }
}
