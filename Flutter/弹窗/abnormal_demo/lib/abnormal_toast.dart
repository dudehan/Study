import 'dart:ui';

import 'package:flutter/material.dart';
import 'application.dart';
import 'error_page.dart';

typedef AlertAction = Function();

class LCToast {
  LCToast();

  static bool isDismiss = false;

  static showLcToast(
    String msg, {
    Duration duration,
    AlertAction action,
  }) {
    _addOverlay();
  }

  static showErrorToast() {
    _addOverlay();
  }

  static _addOverlay({
    String msg,
    Duration duration,
    AlertAction action,
  }) {
    OverlayState overlay = Application.navigatorKey.currentState.overlay;
    if (Application.overlayEntry == null) {
      OverlayEntry overlayEntry = OverlayEntry(builder: (build) {
        return AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(microseconds: 1000),
          child: _buildToastWidget(),
        );
      });
      Application.overlayEntry = overlayEntry;
      overlay.insert(overlayEntry);
    } else {
      OverlayState overlay = Application.navigatorKey.currentState.overlay;
      overlay.insert(Application.overlayEntry);
    }

    // overlay.widget.initialEntries.last = overlayEntry;
//    Future(test(overlayEntey));
//    await Future.delayed(Duration(seconds: 5));
//    overlayEntey.remove();
  }

  static test(OverlayEntry entry) {
    if (!isDismiss) {
      print('========');
      Future(test(entry));
    } else {
      entry.remove();
    }
  }



  static _buildToastWidget({
    String msg,
    Duration duration,
    AlertAction action,
    BuildContext context,
    OverlayEntry entry,
  }) {
    double width = window.physicalSize.width / window.devicePixelRatio;
    double height = window.physicalSize.height / window.devicePixelRatio;

    EdgeInsets defEdgeInsets = EdgeInsets.fromLTRB(width - 45, 300, 15, height - 30 - 300);
//    print('code == ${Application.navigatorKey.currentContext.toString()}');
//    RouteSettings()


    return Card(
          color: Colors.yellow,
          margin: defEdgeInsets,
          child: InkWell(
            child: Icon(Icons.warning),
            onTap: () {
              OverlayState overlay =
                  Application.navigatorKey.currentState.overlay;
//            OverlayEntry entry = overlay.widget.initialEntries[overlay.widget.initialEntries.length - 1];
//            entry.remove();

              OverlayEntry entry =  Application.overlayEntry;
              entry.remove();
              Application.navigatorKey.currentState
                  .push(MaterialPageRoute(builder: (builder) {
                return ErrorPageDemo();
              }));
            },
          ),
    );
  }
}

class TestDemo extends StatefulWidget {
  @override
  _TestDemoState createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white24,
        margin: EdgeInsets.only(top: 100, left: 100),
        child: InkWell(
          child: Icon(Icons.warning),
          onTap: () {
            OverlayState overlay =
                Application.navigatorKey.currentState.overlay;
             for (OverlayEntry item  in overlay.widget.initialEntries) {
               print('item =========== $item');
             }

//            print('count :before ==== ${overlay.widget.initialEntries.length}');
//            overlay.widget.initialEntries.removeLast();
//            print('count : end ==== ${overlay.widget.initialEntries.length}');
//            (overlay as Element).markNeedsBuild();
            Application.navigatorKey.currentState
                .push(MaterialPageRoute(builder: (builder) {
              return ErrorPageDemo();
            }));
          },
        ),
      ),
    );
  }
}
