import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> _animationRotation;
  Animation<double> _animationRadiusIn;
  Animation<double> _animationRadiusOut;

  double initialRadius = 40.0;
  double radius = 0.0;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    _animationRadiusIn = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    _animationRotation = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _animationRadiusOut = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    _controller.addListener(() {
      setState(() {
        if(_controller.value >= 0.75 && _controller.value <= 1.0){
          radius = _animationRadiusIn.value * initialRadius;
        } else  if(_controller.value >= 0.0 && _controller.value <= 0.25){
          radius = _animationRadiusOut.value * initialRadius;
        }
      });
    });
    _controller.repeat();
    // rotationAnimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Center(
            child: RotationTransition(
              turns: _animationRotation,
              child: Stack(
                children: [
                  Dot(radius: 30, color: Colors.blue),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(pi / 4),
                      radius * sin(pi / 5),
                    ),
                    child: Dot(radius: 5, color: Colors.yellow),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(pi / 2),
                      radius * sin(pi / 2),
                    ),
                    child: Dot(radius: 5, color: Colors.green),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(3 * pi / 4),
                      radius * sin(3 * pi / 4),
                    ),
                    child: Dot(radius: 5, color: Colors.deepOrange),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(4 * pi / 4),
                      radius * sin(4 * pi / 4),
                    ),
                    child: Dot(radius: 5, color: Colors.deepPurple),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(5 * pi / 4),
                      radius * sin(5 * pi / 4),
                    ),
                    child: Dot(radius: 5, color: Colors.teal),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(6 * pi / 4),
                      radius * sin(6 * pi / 4),
                    ),
                    child: Dot(radius: 5, color: Colors.pinkAccent),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(7 * pi / 4),
                      radius * sin(7 * pi / 4),
                    ),
                    child: Dot(radius: 5, color: AppTheme.lightText),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(8 * pi / 4),
                      radius * sin(8 * pi / 4),
                    ),
                    child: Dot(radius: 5, color: AppTheme.lightText),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const Dot({@required this.radius, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}
