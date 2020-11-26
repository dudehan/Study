import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;
  int count = 0;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000)
    );

    animation = Tween(begin:0.0,end:300.0).animate(controller)
    // ..addStatusListener((status) {
    //   if(status == AnimationStatus.completed) {
    //     print('AnimationStatus.completed');
    //     count = 0;
    //     controller.reverse();
    //   } else if(status == AnimationStatus.dismissed) {
    //     print('AnimationStatus.dismissed');
    //     controller.forward();
    //   }
    // })
    ..addListener(() {
      // print('================= ${count++}');
      setState(() {

      });
    });

    // controller.forward();
    controller.repeat(reverse:true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(

      child:  Container(
        margin: EdgeInsets.symmetric(vertical:10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo()
      ),

      
    );
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}