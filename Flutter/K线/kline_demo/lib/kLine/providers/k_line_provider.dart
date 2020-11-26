import 'package:flutter/material.dart';
import '../models/k_line_model.dart';
import '../models/foreground_model.dart';

import 'dart:math';

class KLineProvider extends ChangeNotifier {
  KLineModel kLineModel;
  ForegroundModel foregroundModel;

  List<KLinePoint> _points = [];
  Size _size;

  List<KLinePoint> get points => _points;
  Size get size => _size;

  int get pointCounts => _points.length;

  List get minMax => _calculatorMinMax(points);

  ///单位宽
  double get max => minMax[1];

  ///单位宽
  double get min => minMax[0];

  ///最大值与最小值的差值
  double get difValue => max - min;

  ///单位宽
  double get unitWidth => size.width / (pointCounts - 1);

  ///单位高
  double get unitHeight => size.height / difValue;

  set size(Size value) {
    kLineModel.size = value;
    notifyListeners();
  }

  setKlineModel(KLineModel model) {
    _points = model.points;
    _size = model.size;

  }
  setPoints(List value) {
    _points = value;
    notifyListeners();
  }

  void setForegroundModel(ForegroundModel model) {
    foregroundModel = model;
    if (model.gestureType == GestureType.end) {
      foregroundModel.closest = null;
    }
    _lookingForClosestPoint(model.location);
    notifyListeners();
  }

  _calculatorMinMax(List<KLinePoint> points) {
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

  _lookingForClosestPoint(Offset point) {
    List<KLinePoint> points = _points;

    int count = point.dx ~/ unitWidth;
    print('count ==== $count');
    print('unitWidth ==== $unitWidth');
    double value = point.dx % unitWidth;
//    print('******************');
//    print('point.dx === ${point.dx}');
//    print('unitWidth === $unitWidth');
//    print('count === $count');
//    print('value === $value');
//    print('points === $points');
//    print('point === $point');

    if (value > unitWidth / 2) {
      double y = (points[count + 1].instrumentPL - min) / difValue * size.height;
      foregroundModel.closest = Offset((count + 1) * unitWidth, y);

      foregroundModel.closestPoint = _points[count + 1];

    } else {
      double y = (points[count].instrumentPL - min) / difValue * size.height;
      foregroundModel.closest = Offset(count * unitWidth, y);

      foregroundModel.closestPoint = _points[count];
    }
  }

  changePointCounts(int count) {
    List points = _randomValue(count);
    setPoints(points);
  }

  _randomValue(int count) {
    List<KLinePoint> values = [];
    for (int i = 0; i < count; i++) {
      int random = Random().nextInt(100) + 0;
      var p = {'instrumentPL':random.toDouble(),'time':'1978-07-02 03:40:51'};
      values.add(KLinePoint.fromJson(p));
    }
    return values;
  }

}
