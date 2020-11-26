import 'package:flutter/material.dart';
import 'package:stream_builder/third_page.dart';
import 'model.dart';
import 'second_page.dart';

class FirsPage extends StatefulWidget {
  @override
  _FirsPageState createState() => _FirsPageState();
}

class _FirsPageState extends State<FirsPage> {
  OrderResultViewModel _orderResultViewModel = new OrderResultViewModel();

  @override
  void initState() {
    _orderResultViewModel.fetchOrderResultData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build : firstPage');
    return StreamBuilder(
      stream: _orderResultViewModel.outOrderResultModel,
      builder: (ctx, snapShot) {
        if (snapShot.hasData) {
          OrderResultModel model = snapShot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('firstPage'),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return SecondPage();
                      }));
                    },
                    child: Text('to secondPage'),
                  ),
                  Text(model.errorId)
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
