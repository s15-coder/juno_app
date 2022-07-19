import 'package:flutter/material.dart';
import 'package:juno_app/config/config.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.width,
    this.height,
  }) : super(key: key);
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: greyCard, borderRadius: BorderRadius.circular(10)),
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}
