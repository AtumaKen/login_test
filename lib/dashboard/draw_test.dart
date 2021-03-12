import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_test/dashboard/test_screen.dart';
import 'package:login_test/loading_screen/load_sscreen.dart';
import 'package:login_test/loggin.dart';
import 'package:login_test/terrr.dart';

import 'home_drawer.dart';

class CustomDraw extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final double drawerWidth;
  final Function(bool) drawerIsOpen;

  const CustomDraw(
      {this.animatedIconData = AnimatedIcons.arrow_menu,
      this.drawerWidth = 250,
      this.drawerIsOpen});

  @override
  _CustomDrawState createState() => _CustomDrawState();
}

class _CustomDrawState extends State<CustomDraw> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController iconAnimationController;
  bool expanded = false;

  // static ScrollController scrollController;
  Widget screenView;
  Widget menuView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    screenView = LoginPage();
  }

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    final double maxSlide = 250.0;
    return GestureDetector(
      onHorizontalDragEnd: (dragEndDetails) {
        if (dragEndDetails.primaryVelocity < 0)
          _animationController.reverse();
        else if (dragEndDetails.primaryVelocity > 0)
          _animationController.forward();
      },
      child: AnimatedBuilder(
        builder: (context, _) {
          double slide = maxSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget child) {
                    return HomeDrawer(
                      screenIndex:
                          drawerIndex == null ? DrawerIndex.HOME : drawerIndex,
                      iconAnimationController: _animationController,
                      callBackIndex: (DrawerIndex indexType) {
                        try {
                          changeIndex(indexType);
                        } catch (e) {}
                      },
                    );
                  },
                ),
              ),
              Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        _animationController.isDismissed ? 0 : 30),
                    child: Stack(
                      children: [
                        screenView,
                        drawIcon(),
                      ],
                    ),
                  ))
            ],
          );
        },
        animation: _animationController,
        // child: smallCont,
      ),
    );
  }

  Widget drawIcon() {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, left: 8),
      child: SizedBox(
        width: AppBar().preferredSize.height - 8,
        height: AppBar().preferredSize.height - 8,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
            child: Center(
              // if you use your own menu view UI you add form initialization
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: _animationController,
              ),
            ),
            onTap: () {
              toggle();
            },
          ),
        ),
      ),
    );
  }

  Widget _subMenuBuilder(List<String> list) {
    return list.isEmpty
        ? Container()
        : AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, i) {
                  return Material(
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(list[i]),
                      ),
                    ),
                  );
                }),
          );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = LoginScreen3();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = TestScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = Container(
            color: Colors.yellow,
          );
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = LoadingScreen();
        });
      } else {
        //do in your way......
      }
    }
  }
}
