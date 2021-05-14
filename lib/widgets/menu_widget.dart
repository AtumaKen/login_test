import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';
import 'package:login_test/dashboard/home_drawer.dart';

class MenuItemWidget extends StatefulWidget {
  final DrawerModel drawerModel;
  final DrawerIndex listIndex;
  final DrawerIndex screenIndex;
  final Function callBackIndex;
  final AnimationController controller;
  final Widget screenView;

  const MenuItemWidget(
      {Key key,
      @required this.drawerModel,
      @required this.listIndex,
      @required this.screenIndex,
      @required this.controller,
      @required this.screenView,
      @required this.callBackIndex})
      : super(key: key);

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.controller.reverse();
            widget.callBackIndex();
          },
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: widget.listIndex == widget.screenIndex
                          ? AppTheme.nearlyWhite
                          : Colors.transparent,
                      borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  widget.drawerModel.isAssetsImage
                      ? Container(
                          width: 24,
                          height: 24,
                          child: Image.asset(widget.drawerModel.imageName,
                              color: widget.listIndex == widget.screenIndex
                                  ? AppTheme.nearlyWhite
                                  : AppTheme.unSelected),
                        )
                      : Icon(widget.drawerModel.icon.icon,
                          color: widget.listIndex == widget.screenIndex
                              ? AppTheme.nearlyWhite
                              : AppTheme.unSelected),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    widget.drawerModel.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: widget.listIndex == widget.screenIndex
                          ? AppTheme.nearlyWhite
                          : AppTheme.unSelected,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
