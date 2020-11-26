import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'page_c.dart';
import 'toast.dart';
import 'application.dart';

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<NavigatorObserver> observers = Navigator.of(context).widget.observers;
    print('PageB ===== ${observers.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text('PageB'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (build) => PageC()));
//                OverlayState overlay = Application.navigatorKey.currentState.overlay;
//                LCToast.showErrorToast();
              },
              child: Text('navigate to C'),
            ),
            RaisedButton(
              onPressed: () {
                OverlayState overlay = Application.navigatorKey.currentState.overlay;
                overlay.insert(Application.overlayEntry);
//                 Navigator.of(context).push(MaterialPageRoute(builder: (build) => PageC()));
//                showToast('msg');
              },
              child: Text('navigate to C'),
            )
          ],
        ),
      ),
    );
  }

}
