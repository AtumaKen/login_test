import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';
import 'package:login_test/dashboard/home_drawer.dart';
import 'package:login_test/widgets/custom_alert.dart';
import 'package:login_test/widgets/not_available.dart';

class SubMenuScreen extends StatelessWidget {
  final List<SubMenuModel> subMenus;
  final String title;

  const SubMenuScreen({Key key, this.subMenus, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white70,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, top: 5),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => subMenus[index].screen == null? NotAvailable() : subMenus[index].screen,
                    ),
                  ),
                  title: Text(
                    subMenus[index].title,
                    style: TextStyle(
                        fontSize: 18, color: AppTheme.easySwitchGreen),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppTheme.easySwitchGreen,
                  ),
                ),
                Divider(
                  thickness: 0.5,
                )
              ],
            );
          },
          itemCount: subMenus.length,
        ),
      ),
    );
  }
}
