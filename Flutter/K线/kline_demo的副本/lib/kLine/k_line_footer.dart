import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/k_line_provider.dart';

class KLineFooter extends StatefulWidget {
  @override
  _KLineFooterState createState() => _KLineFooterState();
}

class _KLineFooterState extends State<KLineFooter> {

  int _index = 0;
  List _list = ['1W', '1M', '3M', '6M', '1Y'];
  List _pointCounts = [20, 50, 100, 150, 200];


  @override
  Widget build(BuildContext context) {
    print('======== KLineFooter');
    return Container(
      height: 30,
//        color: Colors.red,
      child: ListView.builder(
        itemCount: _list.length,
        itemExtent: MediaQuery.of(context).size.width / (_list.length),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
//              width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((200.0)),
            ),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  if (index != _index) {
                    if (index < _pointCounts.length) {
                      int count = _pointCounts[index];
                      Provider.of<KLineProvider>(context, listen: false)
                          .changePointCounts(count);
                      setState(() {
                          _index = index;
                      });
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(_list[index],style: TextStyle(color: index == _index ? Colors.red : Color.fromRGBO(51, 51, 51, 1)),),
              ),
            ),
          );
        },
      ),
    );
  }


}
