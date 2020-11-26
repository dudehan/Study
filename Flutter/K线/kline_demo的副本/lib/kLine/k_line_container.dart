import 'package:flutter/material.dart';
import 'package:kline_demo/kLine/models/k_line_model.dart';
import 'k_line.dart';
import 'k_line_foreground.dart';
import 'models/foreground_model.dart';
import 'event_bus.dart';
import 'k_line_custom_paint.dart';
import 'package:provider/provider.dart';
import 'providers/k_line_provider.dart';
import 'k_line_header.dart';
import 'k_line_gesture.dart';
import 'k_line_footer.dart';


//typedef Header = Widget Function(dynamic value);
class LCKlineContainer extends StatefulWidget {
  final List values;
  final Size size;

  final Widget header;
  final Widget body;
  final Widget footer;

  LCKlineContainer(
          {@required this.values, this.size, this.header, this.body, this.footer});
  @override
  _LCKlineContainerState createState() => _LCKlineContainerState(
    values: values,size: size,header: header,body: body,footer: footer
  );
}

class _LCKlineContainerState extends State<LCKlineContainer> {

//class LCKlineContainer extends StatelessWidget {
  final List values;
  final Size size;

  final Widget header;
  final Widget body;
  final Widget footer;

  _LCKlineContainerState(
      {@required this.values, this.size, this.header, this.body, this.footer});
  @override


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
//        ChangeNotifierProvider.value(value: KLineProvider(),)
      ChangeNotifierProvider(create: (ctx) => KLineProvider(),),
    ],

      child: Column(
        children: <Widget>[
          header ?? KLineHeader(size: size),
//        header(10),

          body ?? KLineBody(size: size, values: values),
          footer ?? KLineFooter(),
        ],
      ),
    );
  }
}




