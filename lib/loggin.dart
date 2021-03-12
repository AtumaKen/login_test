import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(120.0),
                child: Center(
                  child: Icon(
                    Icons.headset_mic,
                    color: Colors.redAccent,
                    size: 50.0,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "EMAIL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.lightText,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: AppTheme.lightText,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: new Text(
                        "PASSWORD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.lightText,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: AppTheme.lightText,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FlatButton(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.lightText,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: AppTheme.lightText,
                        onPressed: () => {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "LOGIN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
