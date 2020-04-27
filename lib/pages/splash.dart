import 'package:covidata/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:covidata/utils/data.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Data data = Data();

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
            .pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Home(data)))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _widgets,
        ));
  }
}
