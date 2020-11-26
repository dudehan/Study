import 'package:flutter/material.dart';
import '../models/k_line_model.dart';
import '../models/foreground_model.dart';
import 'dart:math';

class KLineProvider extends ChangeNotifier {
  KLineModel kLineModel;
  ForegroundModel foregroundModel;

  List get points => kLineModel.points;

  Size get size => kLineModel.size;

  int get pointCounts => points.length;

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

  set points(List value) {
    kLineModel.points = value;
    notifyListeners();
  }

  void setForegroundModel(ForegroundModel model) {
    foregroundModel = model;
//    closest = _lookingForClosestPoint(model.location);
    if (model.gestureType == GestureType.end) {
      foregroundModel.closest = null;
    }
    _lookingForClosestPoint(model.location);
    notifyListeners();
  }

  _calculatorMinMax(List points) {
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

  _lookingForClosestPoint(Offset point) {
    List points = kLineModel.points;

    int count = point.dx ~/ unitWidth;
    double value = point.dx % unitWidth;
//    print('******************');
//    print('point.dx === ${point.dx}');
//    print('unitWidth === $unitWidth');
//    print('count === $count');
//    print('value === $value');
//    print('points === $points');
//    print('point === $point');

    if (value > unitWidth / 2) {
      double y = (points[count + 1] - min) / difValue * size.height;
//      print(' === ${Offset(point.dx + value, y)}');

      foregroundModel.value = points[count + 1];
      foregroundModel.closest = Offset(point.dx + value, y);
    } else {
      double y = (points[count] - min) / difValue * size.height;
//      print(' === ${Offset(point.dx - value, y)}');
      foregroundModel.value = points[count];
      foregroundModel.closest = Offset(point.dx - value, y);
    }
  }

  changePointCounts(int count) {
    List points = _randomValue(count);
    kLineModel.points = _randomValue(count);
    notifyListeners();
  }

  _randomValue(int count) {
    List values = [];
    for (int i = 0; i < count; i++) {
      int random = Random().nextInt(100) + 0;
      values.add(random.toDouble());
    }
    print('values = $values');
    return values;
  }

}
