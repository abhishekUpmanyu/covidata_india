import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
        color: Colors.black,
        textTheme: TextTheme(
            headline6: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xFF9E9E9E),
                fontFamily: 'Lovelo',
                fontWeight: FontWeight.w600,
                fontSize: 28.0)),
        iconTheme: IconThemeData(color: Color(0xFF9E9E9E))),
    bottomAppBarColor: Colors.black,
    cardColor: Color(0xFF2A2A2A),
    textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'Darker Grotesque', fontSize: 16.0)),
    accentColor: Colors.teal);

final lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.white,
        textTheme: TextTheme(
            headline6: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black54,
                fontFamily: 'Darker Grotesque',
                fontWeight: FontWeight.w600,
                fontSize: 28.0)),
        iconTheme: IconThemeData(color: Color(0xFF9E9E9E))),
    bottomAppBarColor: Colors.white,
    cardColor: Colors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(fontFamily: 'Darker Grotesque', fontSize: 16.0),
    button: TextStyle(fontFamily: 'Darker Grotesque', fontSize: 12.0, color: Colors.black)),
    accentTextTheme: TextTheme(
        button: TextStyle(
            fontFamily: 'Darker Grotesque',
            fontSize: 12.0,
            color: Colors.white)),
    accentColor: Colors.blue);
