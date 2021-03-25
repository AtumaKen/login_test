import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';

class ESButton extends StatelessWidget {
  final String text;
  final double left, right, top, bottom;

  const ESButton(
      {Key key,
      this.text,
      this.left = 10,
      this.right = 10,
      this.top = 10,
      this.bottom = 10})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle:
            TextStyle(color: Colors.white),
        primary: AppTheme.easySwitchGreen,
        padding:
          EdgeInsets.only( top: top, bottom: bottom),
        ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
      ),
    );
  }
}
