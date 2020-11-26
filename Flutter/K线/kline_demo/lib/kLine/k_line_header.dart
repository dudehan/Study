import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/k_line_provider.dart';
import 'models/foreground_model.dart';

///头部
class KLineHeader extends StatefulWidget {
  final Size size;

  KLineHeader({this.size});

  @override
  _KLineHeaderState createState() => _KLineHeaderState(size: this.size);
}

class _KLineHeaderState extends State<KLineHeader> {
  final Size size;

  _KLineHeaderState({this.size});

  @override
  Widget build(BuildContext context) {
    ForegroundModel model = Provider.of<KLineProvider>(context).foregroundModel;

    return Container(
      alignment: Alignment.center,
      height: 51,
      width: size == null ? size.width : MediaQuery.of(context).size.width,
      child: _body(model),
    );
  }

  Widget _body(ForegroundModel model) {
    if (model != null && model.gestureType != GestureType.end) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: <Widget>[
            Text('\$ ${model.closestPoint.instrumentPL.toString()}',
                    style: TextStyle(
                            color: Color.fromRGBO(51, 190, 135, 1), fontSize: 12)),
            Text(
              model.closestPoint.time.toString(),
              style: TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1), fontSize: 12),
            ),
          ],
        ),
      );
    }
    return Container();

  }
}
