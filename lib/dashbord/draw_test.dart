import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDraw extends StatefulWidget {
  @override
  _CustomDrawState createState() => _CustomDrawState();
}

class _CustomDrawState extends State<CustomDraw>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  var bigCont = Container(
    color: Colors.amber,
  );
  var smallCont = Container(
    color: Colors.blueGrey,
  );

  @override
  Widget build(BuildContext context) {
    final double maxSlide = 225.0;
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
        builder: (context, _) {
          double slide = maxSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            children: [
              bigCont,
              Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: smallCont)
            ],
          );
        },
        animation: _animationController,
        // child: smallCont,
      ),
    );
  }
}
