import 'wallet_import.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
      onUnknownRoute: unknownRoute,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: RaisedButton(
          onPressed: () {
            print('导航');
            Navigator.of(context).pushNamed('xxxx');
          },
          child: Text('跳转'),
        ),
    );
  }
}

Route unknownRoute(RouteSettings settings) {
  if (settings.name == '/') return null;
  return WXDialogRoute(
    transitionDuration: Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return FadeTransition(
        opacity: animation,
        child: WalletImport(),
      );
    },
  );
}
