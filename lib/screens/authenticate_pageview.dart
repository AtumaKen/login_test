import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_test/screens/login_screen.dart';
import 'package:login_test/screens/sign_up_screen.dart';

import 'auth_home.dart';

class LoginScreen3 extends StatefulWidget {
  @override
  _LoginScreen3State createState() => _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginScreen3>
    with TickerProviderStateMixin {
  PageController _controller =
      PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            LoginPage(),
            HomePage(_controller),
            SignupPage(_controller)
          ],
          scrollDirection: Axis.horizontal,
        ));
  }
}
