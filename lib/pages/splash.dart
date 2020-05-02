import 'package:covidata/pages/home.dart';
import 'package:covidata/utils/theme.dart';
import 'package:covidata/utils/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:covidata/utils/data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Data data = Data();

  bool _darkMode;

  final List<Widget> _widgets = [
    Hero(
        tag: 'covidata',
        child: Text('CoviData',
            style: TextStyle(fontFamily: 'Megrim', fontSize: 42.0)))
  ];

  @override
  void initState() {
    Future.delayed(
        Duration(milliseconds: 1500),
        () => setState(() => _widgets.add(Text('India',
            style: TextStyle(
                fontFamily: 'Darker Grotesque',
                fontSize: MediaQuery.of(context).size.width / 18)))));
    Future.delayed(
        Duration(milliseconds: 3000),
        () => setState(() => _widgets.add(Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ))));
    Future.delayed(
        Duration(milliseconds: 3000),
        () => data.getData().whenComplete(() => Navigator.of(context)
            .pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Home()))));
    super.initState();
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  Future _setTheme() async {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkMode = (themeNotifier.getTheme() == darkTheme);
    SharedPreferences.getInstance().then((prefs) => setState(() {
          _darkMode = prefs.getBool('darkMode') ?? false;
          onThemeChanged(_darkMode, themeNotifier);
        }));
  }

  @override
  Widget build(BuildContext context) {
    _setTheme();
    return Material(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _widgets,
        ));
  }
}
