
import 'package:flutter/cupertino.dart';

enum GestureType {
    start,
    move,
    end
}

class ForegroundModel {

    Offset location;
    Offset closest;
    double value;

    GestureType gestureType;
    ForegroundModel({this.location,this.gestureType});

}