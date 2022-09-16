import 'package:flutter/material.dart';

class MyTheme {
  var theme = ThemeData(
    primarySwatch: Colors.purple,
    scaffoldBackgroundColor: Color.fromARGB(221, 39, 39, 39),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline6: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Hind',
          color: Color.fromARGB(255, 205, 206, 211)),
      bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Hind',
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 205, 206, 211)),
    ),
  );
}
