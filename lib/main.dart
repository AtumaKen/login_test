import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';
import 'package:login_test/providers/theme_mode_notifier.dart';
import 'package:login_test/screens/authenticate_pageview.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStateNotifier(),
        ),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AppStateNotifier>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: LoginScreen3(),
          );
        },
      ),
    );
  }
}
