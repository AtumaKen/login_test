import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';
import 'package:login_test/widgets/name_icon_item.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Positioned(
            top: 410,
            left: 20,
            child: Container(
              height: 200,
              width: 390,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            top: 130,
            left: 20,
            child: Container(
              height: 300,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.indigoAccent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _walletBalance(),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 40,
            child: NameIconWidget(),
          ),
        ],
      ),
    );
  }
  Widget _walletBalance(){
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
}
