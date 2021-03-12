import 'package:flutter/material.dart';
import 'package:login_test/dashboard/draw_test.dart';
import 'package:login_test/terrr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(30, 61, 40, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: CustomDraw(),
    );
  }
}


