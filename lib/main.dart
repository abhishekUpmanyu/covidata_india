import 'package:covidata/pages/about.dart';
import 'package:covidata/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:covidata/utils/theme.dart';
import 'package:covidata/utils/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier(lightTheme),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.getTheme(),
      home: Splash(),
    );
  }
}