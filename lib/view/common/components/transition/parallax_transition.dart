import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParallaxTransition extends CustomTransition{

  @override
  Widget buildTransition(BuildContext context, Curve? curve, Alignment? alignment, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    Tween t1 = new Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    );
    Tween t9 = Tween<Offset>(
      begin: const Offset(0.0, 0),
      end: const Offset(0.0, -1.0),
    );


    return SlideTransition(
      position: t1.animate(secondaryAnimation) as Animation<Offset>,
      child:  SlideTransition(
        position: t9.animate(animation) as Animation<Offset>,
        child: child,
      ),
    );
  }

}