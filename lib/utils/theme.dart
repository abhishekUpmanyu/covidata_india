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
        headline1: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white54,
            fontFamily: 'Darker Grotesque',
            fontSize: 24.0),
        subtitle1: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white70,
            fontFamily: 'Darker Grotesque',
            fontSize: 18.0),
        bodyText1: TextStyle(fontFamily: 'Darker Grotesque', fontSize: 16.0),
        bodyText2: TextStyle(
            color: Colors.white70,
            fontFamily: 'Darker Grotesque',
            fontSize: 18.0),
      button: TextStyle(
        fontWeight: FontWeight.w500,
          color: Colors.white70,
          fontFamily: 'Darker Grotesque',
          fontSize: 14.0)
    ),
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
        headline1: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
            fontFamily: 'Darker Grotesque',
            fontSize: 24.0),
        subtitle1: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontFamily: 'Darker Grotesque',
            fontSize: 18.0),
        bodyText1: TextStyle(fontFamily: 'Darker Grotesque', fontSize: 16.0),
        bodyText2: TextStyle(
            color: Colors.black87,
            fontFamily: 'Darker Grotesque',
            fontSize: 18.0),
        button: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontFamily: 'Darker Grotesque',
            fontSize: 14.0)
    ),
    accentTextTheme: TextTheme(
        button: TextStyle(
            fontFamily: 'Darker Grotesque',
            fontSize: 12.0,
            color: Colors.black)),
    accentColor: Colors.blue);
