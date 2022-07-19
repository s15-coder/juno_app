import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juno_app/config/config.dart';

import 'light_text_theme.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  textTheme: lightTextTheme,
  canvasColor: Colors.white,
  backgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) => greenJuno),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: Colors.black),
  ),
);
