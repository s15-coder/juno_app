import 'package:flutter/material.dart';
import 'package:juno_app/config/config.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              greenJuno,
              greenJuno.withOpacity(0),
            ], begin: Alignment.centerRight, end: Alignment.topLeft)),
        child: CircleAvatar(child: child, backgroundColor: Colors.transparent));
  }
}
