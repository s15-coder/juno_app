import 'package:flutter/material.dart';
import 'package:juno_app/config/config.dart';

extension CustomColorScheme on ColorScheme {
  Color get iconDrawer => brightness == Brightness.light
      ? const Color(0xFF000000)
      : const Color.fromRGBO(96, 96, 96, 1);
  Color get oppositeColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;
  Color get cardColor =>
      brightness == Brightness.light ? greyCard : const Color(0xFF212121);
  Color get blueOrWhite =>
      brightness == Brightness.light ? blueJuno : Colors.white;
}
