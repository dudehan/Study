import 'package:flutter/material.dart';
import 'page_a.dart';
import 'page_b.dart';
import 'dialog_demo.dart';

class AlertDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.black45,
            ),
          ),
          RaisedButton(
            onPressed: () {
               
              test(context: context);

              // showSimpleDialog(context: context);
              // showAlert(
              //   context: context,
              //   title: 'xxx',
              //   content: 'context',
              //   cancelTitle: 'cancel',
              //   cancel: () {
              //     Navigator.pop(context);
              //   },
              //   ensureTitle: 'ensure',
              //   ensure: () {
              //     Navigator.pop(context);
              //   },
              // );
            },
            child: Text('alert'),
          )
        ],
      ),
    );
  }

  test(
      {@required BuildContext context,
      String title,
      String content,
      String cancelTitle,
      String ensureTitle,
      AlertCallBack cancel,
      AlertCallBack ensure}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color.fromRGBO(234, 221, 132, 0.5),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
      useRootNavigator: true,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return MyCustomDialog();
      },
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  showSimpleDialog(
      {@required BuildContext context,
      String title,
      String content,
      String cancelTitle,
      String ensureTitle,
      AlertCallBack cancel,
      AlertCallBack ensure}) {
    showDialog(
        context: context,
        useRootNavigator: true,
        
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Container(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'title',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: double.infinity,
                    color: Colors.yellow,
                    child: Text(
                      'xxxx',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          height: 30,
                          alignment: Alignment.center,
                          child: Text('取消')),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          height: 30,
                          alignment: Alignment.center,
                          child: Text('确定')),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  showAlert(
      {@required BuildContext context,
      String title,
      String content,
      String cancelTitle,
      String ensureTitle,
      AlertCallBack cancel,
      AlertCallBack ensure}) {
    List<Widget> actions = [];
    if (cancelTitle != null) {
      Widget w = FlatButton(
        onPressed: cancel,
        child: Text(
          cancelTitle,
          style: TextStyle(color: Colors.grey),
        ),
      );
      actions.add(w);
    }
    if (ensureTitle != null) {
      Widget w = FlatButton(
        onPressed: ensure,
        child: Text(ensureTitle, style: TextStyle(color: Colors.red)),
      );
      actions.add(w);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null
              ? Container(
                  alignment: Alignment.center,
                  child: Text(title),
                )
              : null,
          content: content != null
              ? Container(
                  child: Text('context'),
                )
              : null,
          actions: actions,
        );
      },
    );
  }
}

typedef AlertCallBack = Function();
