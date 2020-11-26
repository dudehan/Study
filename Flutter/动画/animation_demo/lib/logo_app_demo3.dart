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

    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeInCirc);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
    controller.forward();

  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(child:LogoWidget(),animation:animation);
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}


// class AnimatedLogo extends AnimatedWidget {

//   AnimatedLogo({Key key,Animation<double> animation}) : super(key : key, listenable: animation);
//   @override
//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return Center(
//       child:  Container(
//         margin: EdgeInsets.symmetric(vertical:10.0),
//         height: animation.value,
//         width: animation.value,
//         child: FlutterLogo()
//       ),
//     ) ;
//   }

// }

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10.0),
      child: FlutterLogo()
    );
  }
}

class GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;
  GrowTransition({this.child,this.animation});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }

}