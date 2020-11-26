import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'k_line.dart';
import 'k_line_foreground.dart';
import 'models/foreground_model.dart';
import 'event_bus.dart';
import 'package:provider/provider.dart';
import 'providers/k_line_provider.dart';
import 'models/k_line_model.dart';

class LCCustomPaint extends StatefulWidget {
  @override
  _LCCustomPaintState createState() => _LCCustomPaintState();
}

class _LCCustomPaintState extends State<LCCustomPaint> {
  @override
  Widget build(BuildContext context) {
    List values = Provider
            .of<KLineProvider>(context)
            .points;
    Size size = Provider
            .of<KLineProvider>(context)
            .size;
    ForegroundModel model = Provider
            .of<KLineProvider>(context)
            .foregroundModel;

    return Container(
      child: CustomPaint(
        painter: LCKlinePainter(values),
        foregroundPainter: ForeGroundPaint(model: model),
        size: size ?? Size(MediaQuery
                .of(context)
                .size
                .width, 200),
      ),
    );
  }
}
