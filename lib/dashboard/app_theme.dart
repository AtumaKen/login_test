import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color unSelected = Color.fromRGBO(136, 180, 180, 1);
  static const Color easySwitchGreen = Color.fromRGBO(30, 61, 40, 1);
  static const String fontName = 'WorkSans';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontSize: 24,
    letterSpacing: 0.27,
    color: Colors.white,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontSize: 18,
    letterSpacing: 0.2,
    color: Colors.white,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.green[100],
    appBarTheme: AppBarTheme(
      color: Color.fromRGBO(255, 255, 250, 1),
    ),
      textTheme: TextTheme(headline4: TextStyle(fontSize: 18, color: AppTheme.easySwitchGreen)),

      colorScheme: ColorScheme.light(
        primary: Color.fromRGBO(255, 255, 250, 1),
        onPrimary: Colors.white,
        primaryVariant: Colors.white38,
        secondary: Colors.green,
      ),
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
    cardTheme: CardTheme(color: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.easySwitchGreen,
    textTheme: TextTheme(headline4: TextStyle(fontSize: 18, color: AppTheme.nearlyWhite)),
    appBarTheme: AppBarTheme(
      color: Colors.black,
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.green,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),

      cardTheme: CardTheme(color: Colors.black26)
  );
}
