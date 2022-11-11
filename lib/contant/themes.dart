import 'package:flutter/material.dart';

ThemeData lighttheme=ThemeData(
  brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
);

ThemeData darktheme=ThemeData(
  brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
  ),
);