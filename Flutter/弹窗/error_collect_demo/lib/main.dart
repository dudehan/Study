import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'first_page.dart';
import 'lc_toast.dart';
import 'package:oktoast/oktoast.dart';
import 'application.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // _addOverlay(context);
    Application.context = context;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage()
    );
  }
}
// home: Stack(
//         children: <Widget>[
//           FirstPage(),
//           Positioned(
//             bottom: 5,
//             right: 5,
//             child: Material(
//               child: IconButton(
//                 icon: Icon(Icons.error),
//                 onPressed: () {
//                   Fluttertoast.showToast(msg: 'aaa');
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
