import 'package:flutter/material.dart';
import 'package:login_test/dashboard/draw_test.dart';
import 'package:login_test/terrr.dart';
import 'package:login_test/widgets/menu_widget.dart';

import 'app_theme.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer(
      {Key key,
      this.screenIndex,
      this.iconAnimationController,
      this.screenView,
      this.callBackIndex})
      : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerModel) callBackIndex;
  final Widget screenView;

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  //i want to change the clicked property of the submenu model when a submenu item is tapped
  List<DrawerModel> drawerList;
  bool expanded = false;

  @override
  void initState() {
    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerModel>[
      DrawerModel(
          index: DrawerIndex.HOME,
          labelName: 'Dashboard',
          icon: Icon(Icons.home),
          subMenu: []),
      DrawerModel(
        index: DrawerIndex.MobileTopUp,
        labelName: 'Mobile Top-Up',
        isAssetsImage: true,
        imageName: 'assets/images/supportIcon.png',
      ),
      // subMenu: {"Buy Airtime": CustomDraw(), "Buy Data": CustomDraw()}),
      DrawerModel(
          index: DrawerIndex.PayBills,
          labelName: 'Pay Bills',
          icon: Icon(Icons.help),
      ),
      DrawerModel(
          index: DrawerIndex.SendReceiveMoney,
          labelName: 'Send, Receive Money',
          icon: Icon(Icons.group),
          ),
      DrawerModel(
          index: DrawerIndex.Share,
          labelName: 'More',
          icon: Icon(Icons.share),
          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.easySwitchGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: widget.iconAnimationController,
                    builder: (BuildContext context, Widget child) {
                      return ScaleTransition(
                        scale: AlwaysStoppedAnimation<double>(
                            1.0 - (widget.iconAnimationController.value) * 0.2),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation<double>(Tween<double>(
                                      begin: -180, end: 0.0)
                                  .animate(CurvedAnimation(
                                      parent: widget.iconAnimationController,
                                      curve: Curves.fastOutSlowIn))
                                  .value /
                              360),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: AppTheme.grey.withOpacity(0.6),
                                    offset: const Offset(2.0, 4.0),
                                    blurRadius: 8),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(60.0)),
                              child: Image.asset('assets/images/userImage.png'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 4),
                    child: Text(
                      'Chris Hemsworth',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.nearlyWhite,
                        letterSpacing: 1,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            //builds the entire menu items including it's submenu
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList[index]);
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: AppTheme.unSelected,
                        ),
                        trailing: Text(
                          "Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppTheme.unSelected,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ListTile(
                        leading: Text(
                          "|",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppTheme.unSelected,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        trailing: Text(
                          "Log out",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppTheme.unSelected,
                              letterSpacing: 1),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.top * 1.5,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget inkwell(DrawerModel listData) {
    return Material(
      color: Colors.transparent,
      child: MenuItemWidget(
        drawerModel: listData,
        listIndex: listData.index,
        screenIndex: widget.screenIndex,
        controller: widget.iconAnimationController,
        screenView: widget.screenView,
        callBackIndex: () => navigationToScreen(listData),
      ),
    );
  }

  Future<void> navigationToScreen(DrawerModel indexScreen) async {
    widget.callBackIndex(indexScreen);
  }
}

enum DrawerIndex {
  HOME,
  PayBills,
  MobileTopUp,
  Share,
  About,
  SendReceiveMoney,
  Testing,
}

class DrawerModel {
  DrawerModel(
      {this.isAssetsImage = false,
      this.labelName = '',
      this.icon,
      this.index,
      this.expanded = false,
      this.imageName = '',
      this.subMenu});

  String labelName;
  Icon icon;
  bool isAssetsImage;
  bool expanded;
  String imageName;
  DrawerIndex index;
  List<SubMenuModel> subMenu;
}

class SubMenuModel {
  String title;

  SubMenuModel({this.title});
}
