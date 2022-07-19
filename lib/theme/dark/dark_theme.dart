import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juno_app/config/config.dart';

import 'dark_text_theme.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: greenJuno,
  textTheme: darkTextTheme,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) => greenJuno),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: greenJuno),
  ),
);
