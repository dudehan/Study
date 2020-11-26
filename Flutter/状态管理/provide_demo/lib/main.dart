import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import './pages/home_page.dart';
import './provide/home_provide.dart';
import './pages/bottom_list_page.dart';
import './provide/bottom_list_privode.dart';
import './pages/future_async_await.dart';

void main() {
  var homePageDataProvide = HomePageDataProvide();
  var bottomListPageProvide = BottomListPrivode();

  var providers = Providers();
  providers
    ..provide(Provider<HomePageDataProvide>.value(homePageDataProvide))
    ..provide(Provider<BottomListPrivode>.value(bottomListPageProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text('')),
        body: MyNavigateRoute()
      ),
    );
  }
}

class MyNavigateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      
            child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              child: Text('HomePage'),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BottomListPage();
                }));
              },
              child: Text('BottomListPage'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FutureDemo();
                }));
              },
              child: Text('FutureTest'),
            ),
          ],
        ),
    );
  }
}
