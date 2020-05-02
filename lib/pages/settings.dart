import 'package:covidata/pages/about.dart';
import 'package:covidata/pages/home.dart';
import 'package:covidata/utils/theme.dart';
import 'package:covidata/utils/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _darkMode;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
