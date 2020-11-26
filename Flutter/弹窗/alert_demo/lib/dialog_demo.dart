import 'package:flutter/material.dart';

class MyCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = Duration(microseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Material(
              color: Theme.of(context).dialogBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
