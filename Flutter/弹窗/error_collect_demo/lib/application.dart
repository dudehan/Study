import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Application {

  static BuildContext context;
  // static Application _application;

  // factory Application.init() {
  //   if (_application == null) {
  //     _application = Application();
  //   }
  //   return _application;  
  // }

  Application();

  void showLcToast() {
    _addOverlay(context);
  }

  void _addOverlay(BuildContext context) async {
    OverlayState overlay = Overlay.of(context);
    OverlayEntry overlayEntey = OverlayEntry(builder: (build) {
      return AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(microseconds: 1000),
        child: _buildToastWidget(),
      );
    });
    overlay.insert(overlayEntey);
    await Future.delayed(Duration(seconds: 2));
    overlayEntey.remove();
  }

  static _buildToastWidget() {
    return Center(
      child: Card(
        color: Colors.black26,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            '_msg',
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

