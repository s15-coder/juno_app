import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get iconDrawer => brightness == Brightness.light
      ? const Color(0xFF000000)
      : const Color.fromRGBO(96, 96, 96, 1);
}
