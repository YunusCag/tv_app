import 'package:flutter/material.dart';

class SlideTransitionContainer extends StatefulWidget {
  final Offset begin;
  final Offset end;
  final Widget child;
  final Duration duration;
  final Curve curve;

  const SlideTransitionContainer({
    Key? key,
    required this.child,
    this.begin = const Offset(1, 0),
    this.end = const Offset(0, 0),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  @override
  _SlideTransitionContainerState createState() =>
      _SlideTransitionContainerState();
}

class _SlideTransitionContainerState extends State<SlideTransitionContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<Offset> offsetAnimation;

  bool isVisible = true;

  @override
  void initState(){
    animController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );


    offsetAnimation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(
      parent: animController,
      curve: widget.curve,
    ));
    animController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: widget.child,
    );
  }
}
