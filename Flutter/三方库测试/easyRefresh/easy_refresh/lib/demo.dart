import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class _Example extends StatefulWidget {
  @override
  _ExampleState createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<_Example> {
  EasyRefreshController _controller;

  // 条目总数
  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EasyRefresh"),
      ),
      body: EasyRefresh.custom(
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controller,
        // header: ClassicalHeader(),
        // footer: ClassicalFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            _controller.finishLoad(noMore: _count >= 80);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(

                  
                  
                );
              },
              childCount: _count,
            ),
          ),
        ],
      ),
      // persistentFooterButtons: <Widget>[
      //   FlatButton(
      //       onPressed: () {
      //         _controller.callRefresh();
      //       },
      //       child: Text("Refresh", style: TextStyle(color: Colors.black))),
      //   FlatButton(
      //       onPressed: () {
      //         _controller.callLoad();
      //       },
      //       child: Text("Load more", style: TextStyle(color: Colors.black))),
      // ]
    );
  }
}
