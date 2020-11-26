import 'dart:ffi';

import 'package:flutter/material.dart';

class KLineModel {
  List<KLinePoint> points = [];
  Size size;

  KLineModel({this.points, this.size});

  KLineModel.fromJson(Map<String, dynamic> json) {
    for (var item in json['data']) {
      points.add(KLinePoint.fromJson(item));
    }
  }
}

class KLinePoint {
  double instrumentPL;
  String time;

  KLinePoint({this.instrumentPL, this.time});

  KLinePoint.fromJson(Map<String, dynamic> json) {
    instrumentPL = json['instrumentPL'];
    time = json['time'];
  }
}
