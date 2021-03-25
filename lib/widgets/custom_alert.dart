import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';
import 'package:login_test/widgets/es_button.dart';

class ECAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Airtime"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Airtime Recharge", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Phone Number"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: _networkWidget(),
                        flex: 1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: _amountWidget(),
                        flex: 1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: ESButton(
                        text: "Buy",
                        top: 20,
                        bottom: 20,
                      ),
                    ),
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _networkWidget() {
    return Column(
      children: [
        Text("Network"),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }

  Widget _amountWidget() {
    return Column(
      children: [
        Text("Amount"),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
