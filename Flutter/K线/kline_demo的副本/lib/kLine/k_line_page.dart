import 'dart:math';

import 'package:flutter/material.dart';
import 'k_line_container.dart';

class KLineDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _randomValue();
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: LCKlineContainer(
//          header: Text('data'),
//          header: (value){
//            return Text('${value.toString()}');
//          },
//        footer: Text('xxx'),
          values: _randomValue(),
          size: Size(MediaQuery.of(context).size.width, 200),
        ),
      ),
    );
  }

  _randomValue() {

    List values = [];
    for (int i = 0; i < 50; i++) {
      int random = Random().nextInt(100) + 0;
      values.add(random.toDouble());
    }
    print('values = $values');
    return values;
  }
}
