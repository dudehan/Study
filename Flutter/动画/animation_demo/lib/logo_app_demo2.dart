import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';




class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000)
    );
    animation = Tween(begin:0.0,end:300.0).animate(controller);
    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation,);
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}


class AnimatedLogo extends AnimatedWidget {

  AnimatedLogo({Key key,Animation<double> animation}) : super(key : key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child:  Container(
        margin: EdgeInsets.symmetric(vertical:10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo()
      ),
    ) ;
  }

}