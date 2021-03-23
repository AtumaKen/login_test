import 'package:flutter/material.dart';
import 'package:login_test/dashboard/home_drawer.dart';

class SubMenuScreen extends StatelessWidget {
  final List<SubMenuModel> subMenus;
  final String title;

  const SubMenuScreen({Key key, this.subMenus, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(subMenus[index].title),
            );
          },
          itemCount: subMenus.length,
        ),
      ),
    );
  }
}
