
import 'package:flutter/cupertino.dart';
import 'k_line_model.dart';

enum GestureType {
    start,
    move,
    end
}

class ForegroundModel {

    Offset location;
    Offset closest;
    KLinePoint closestPoint;
//    double value;

    GestureType gestureType;
    ForegroundModel({this.location,this.gestureType});

}