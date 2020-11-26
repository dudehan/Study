import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'application.dart';
import 'page_b.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OverlayState overlay = Application.navigatorKey.currentState.overlay;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              OverlayState overlay = Application.navigatorKey.currentState.overlay;
              Navigator.of(context).push(MaterialPageRoute(builder: (build)=> PageB()));
              // Application.navigatorState.currentState
              //     .push(MaterialPageRoute(builder: (build) => PageB()));
              
              // Navigator.of(context).push(MaterialPageRoute(builder: (build)=> LearnMaterial()));
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (build) => SecondPage()));
              // Fluttertoast.showToast(
              //   msg: 'xxxx',
              // );
              // _addOverlay(context);
              // Toast.toast(context, 'xxxxx');
            },
            child: Text('按钮'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Fluttertoast.showToast(msg: 'xxxxx');
          Fluttertoast.showToast(msg: 'xx');

        },
        child: Icon(Icons.error),
      ),
    );
  }
}

class Toast {
  static OverlayEntry _overlayEntry; //toast靠它加到屏幕上
  static bool _showing = false; //toast是否正在showing
  static DateTime _startedTime; //开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static String _msg;

  static void toast(
    BuildContext context,
    String msg,
  ) async {
    assert(msg != null);
    _msg = msg;
    _startedTime = DateTime.now();
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _showing = true;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Positioned(
                //top值，可以改变这个值来改变toast在屏幕中的位置
                top: MediaQuery.of(context).size.height * 2 / 3,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.0),
                      child: AnimatedOpacity(
                        opacity: _showing ? 1.0 : 0.0, //目标透明度
                        duration: _showing
                            ? Duration(milliseconds: 100)
                            : Duration(milliseconds: 400),
                        child: _buildToastWidget(),
                      ),
                    )),
              ));
      overlayState.insert(_overlayEntry);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }
    await Future.delayed(Duration(milliseconds: 2000)); //等待两秒

    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= 2000) {
      _showing = false;
      _overlayEntry.markNeedsBuild();
    }
  }

  //toast绘制
  static _buildToastWidget() {
    return Center(
      child: Card(
        color: Colors.white24,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            _msg,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
