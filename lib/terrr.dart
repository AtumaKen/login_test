import 'package:flutter/material.dart';
import 'package:login_test/loggin.dart';
import 'package:login_test/signnn.dart';

import 'homme.dart';

class LoginScreen3 extends StatefulWidget {
  @override
  _LoginScreen3State createState() => new _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginScreen3>
    with TickerProviderStateMixin {

  PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[LoginPage(), HomePage(_controller), SignupPage()],
          scrollDirection: Axis.horizontal,
        ));
  }
}
