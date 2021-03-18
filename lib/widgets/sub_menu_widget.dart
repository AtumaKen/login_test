import 'package:flutter/material.dart';

class SubMenuWidget extends StatefulWidget {
  final String subMenuItem;
  final Function navigate;
  final AnimationController controller;

  const SubMenuWidget(
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
      onTap: (){
        widget.navigate();
        widget.controller.reverse();
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Text(
          widget.subMenuItem,
          style: TextStyle(fontSize: 17, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
