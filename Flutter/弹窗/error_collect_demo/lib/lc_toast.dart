import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class LCToast extends StatefulWidget {
  final Widget child;
  final BuildContext context;
  LCToast({
    @required this.context,
    @required this.child,
  });
  
  @override
  _LCToastState createState() => _LCToastState();
}

class _LCToastState extends State<LCToast> {
 
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void showToast(String msg) {
    _addOverlay(this.context);
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
