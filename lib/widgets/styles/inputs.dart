import 'package:flutter/material.dart';

class Inputs {
  static TextStyle h1({required Color color}) => TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.w400,
        height: .9,
        fontFamily: 'San Francisco',
        color: color,
      );
  static TextStyle h5({Color? color}) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle title({Color? color}) => TextStyle(
        fontSize: 26,
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      );
}
