import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';

class NameIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(30, 61, 40, 0.7)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.green[700]),
              child: Image.asset(
                "assets/images/easyswitch_icon.png",
                height: 40,
              ),
            ),
            Text(
              "Atom",
              style: AppTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
