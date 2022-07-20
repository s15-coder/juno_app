import 'package:flutter/material.dart';
import 'package:juno_app/widgets/custom_circle_avatar.dart';

AppBar customAppBar = AppBar(
  title: const Text(
    'Tasa de cambios',
    style: TextStyle(color: Colors.black),
  ),
  elevation: 0,
  actions: const [
    CustomCircleAvatar(
        child: Icon(
      Icons.person_outline,
      color: Colors.black,
    )),
    SizedBox(width: 10)
  ],
);
