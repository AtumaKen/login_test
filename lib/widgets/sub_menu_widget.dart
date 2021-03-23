
import 'package:flutter/material.dart';
import 'package:login_test/dashboard/draw_test.dart';
import 'package:login_test/dashboard/home_drawer.dart';

class SubMenuWidget extends StatefulWidget {
  final SubMenuModel subMenuItem;
  final Function navigate;
  final AnimationController controller;

   SubMenuWidget(
      {Key key,
      this.subMenuItem,
      @required this.navigate,
      @required this.controller})
      : super(key: key);

  @override
  _SubMenuWidgetState createState() => _SubMenuWidgetState();
}

class _SubMenuWidgetState extends State<SubMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.navigate();
        // widget.controller.reverse();
        setState(() {
          // CustomDrawState().screenView = widget.subMenuItem.widget;
        });
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Text(
          widget.subMenuItem.title,
          style: TextStyle(fontSize: 17, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
