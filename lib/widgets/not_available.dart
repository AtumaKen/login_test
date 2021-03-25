import 'package:flutter/material.dart';

class NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Not available"),
        ),
        body: Center(child: Text("Not Available")));
  }
}
