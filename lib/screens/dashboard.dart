import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_test/dashboard/app_theme.dart';
import 'package:login_test/widgets/name_icon_item.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Positioned(
            child: Text(
              "Dashboard",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            top: 100,
            left: 20,
          ),
          ///purchase widget
          Positioned(
            top: 410,
            left: 20,
            child: Container(
              height: 200,
              width: 390,
              decoration: BoxDecoration(
                border: Border.all(width: 0.1, color: Theme.of(context).iconTheme.color),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 18.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _purchaseButton(
                          "Purchase Airtime",
                          Color.fromRGBO(141, 107, 208, 1),
                          Color.fromRGBO(225, 213, 242, 1)),
                      _purchaseButton(
                          "Purchase Data",
                          Color.fromRGBO(73,160,147, 1),
                          Color.fromRGBO(210,233,231, 1))
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///gradient card
          Positioned(
            top: 130,
            left: 20,
            child: Container(
              height: size.height * 0.38,
              width: size.width * 0.912,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(71, 153, 77, 1),
                  Color.fromRGBO(41, 61, 134, 1)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _walletBalance(),
              ),
            ),
          ),

          ///icon and username widget
          Positioned(
            top: 150,
            left: 40,
            child: NameIconWidget(),
          ),

          ///received amount widget
          Positioned(
            top: 380,
            left: 45,
            child: _receivedSpent(context,
              "Received",
              "\u20A6 0.00",
              Icon(
                Icons.keyboard_arrow_up_outlined,
                color: Colors.green,
                size: 28,
              ),
            ),
          ),

          ///sent amount widget
          Positioned(
            top: 380,
            right: 38,
            child: _receivedSpent(context,
              "Spent",
              "\u20A6 0.00",
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.red,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletBalance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Wallet Balance",
          style: AppTheme.headline,
        ),
        Text(
          "\u20A60",
          style: AppTheme.headline,
        ),
      ],
    );
  }

  Widget _receivedSpent(BuildContext context, String title, String amount, Widget icon) {
    return Card(
      color: Theme.of(context).cardTheme.color,
      shadowColor: Colors.black,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).iconTheme.color,
                        fontSize: 18,
                        letterSpacing: 0.5),
                  ),
                  icon,
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 42,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(235, 237, 243, 1),
              ),
              child: Align(
                child: Text(
                  amount,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                      letterSpacing: 0.8,
                      color: Colors.grey[700]),
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _purchaseButton(String text, Color textColor, Color backgroundColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8,
        ),
      ),
      child: Text(
        text,
        maxLines: 2,
        style: TextStyle(
          color: textColor, fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
