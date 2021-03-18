import 'package:flutter/material.dart';

class ECAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Card(
            child: Column(
              children: [
                Text("Airtime Recharge"),
                SizedBox(
                  height: 20,
                ),
                Text("Phone Number"),
                TextField(),
                Row(
                  children: [_networkWidget(), _amountWidget()],
                )
              ],
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
        TextField()
      ],
    );
  }

  Widget _amountWidget() {
    return Column(
      children: [
        Text("Amount"),
        TextField()
      ],
    );
  }
}
