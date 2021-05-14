import 'package:flutter/material.dart';
import 'package:login_test/dashboard/app_theme.dart';
import 'package:login_test/providers/theme_mode_notifier.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(color: Theme.of(context).iconTheme.color),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark Mode", style: TextStyle(color: Theme.of(context).iconTheme.color, fontSize: 18),
            ),
            Switch(
              activeColor: AppTheme.easySwitchGreen,
              value: Provider.of<AppStateNotifier>(context, listen: false)
                  .isDarkMode,
              onChanged: (boolVal) {
                Provider.of<AppStateNotifier>(context, listen: false)
                    .updateTheme(boolVal);
              },
            ),
          ],
        ),
      ),
    );
  }
}
