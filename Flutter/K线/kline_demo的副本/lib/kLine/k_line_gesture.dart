import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/k_line_provider.dart';
import 'models/foreground_model.dart';
import 'models/k_line_model.dart';
import 'k_line_custom_paint.dart';

///主体
class KLineBody extends StatefulWidget {
  final List values;
  final Size size;

  KLineBody({this.values, this.size});

  @override
  _KLineBodyState createState() => _KLineBodyState(values: values, size: size);
}

class _KLineBodyState extends State<KLineBody> {
  final List values;
  final Size size;

  _KLineBodyState({this.values, this.size});

  @override
  void initState() {
    super.initState();
    Provider.of<KLineProvider>(context,listen: false).kLineModel = KLineModel(points: values,size: size);
    //    Provider.of<KLineProvider>(context,listen: false).foregroundModel = ForegroundModel(location: Offset(100, 10), gestureType: GestureType.end);

  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onLongPressEnd: (details) {
        ForegroundModel fModel = ForegroundModel(
                location: details.localPosition, gestureType: GestureType.end);
        Provider.of<KLineProvider>(context,listen: false).setForegroundModel(fModel);
      },
      onLongPressMoveUpdate: (details) {
        ForegroundModel fModel = ForegroundModel(
                location: details.localPosition, gestureType: GestureType.move);
        Provider.of<KLineProvider>(context,listen: false).setForegroundModel(fModel);
      },
      onLongPressStart: (details) {
        ForegroundModel fModel = ForegroundModel(
                location: details.localPosition, gestureType: GestureType.start);
        Provider.of<KLineProvider>(context,listen: false).setForegroundModel(fModel);

      },
      child: LCCustomPaint(),
    );
  }
}