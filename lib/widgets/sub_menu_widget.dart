import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';

class SubMenuWidget extends StatefulWidget {
  final String subMenuItem;

  const SubMenuWidget({Key key, this.subMenuItem}) : super(key: key);
  @override
  _SubMenuWidgetState createState() => _SubMenuWidgetState();
}

class _SubMenuWidgetState extends State<SubMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.subMenuItem,
      style: AppTheme.subtitle,
    );
  }
}
