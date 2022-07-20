import 'package:flutter/material.dart';
import 'package:juno_app/config/config.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    this.child,
    this.onTap,
    this.maxRadius,
    this.backgroundColor,
  }) : super(key: key);
  final Widget? child;
  final double? maxRadius;
  final void Function()? onTap;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor ?? Colors.white,
              gradient: backgroundColor == null
                  ? LinearGradient(colors: [
                      greenJuno,
                      greenJuno.withOpacity(0),
                    ], begin: Alignment.centerRight, end: Alignment.topLeft)
                  : null),
          child: CircleAvatar(
            child: child,
            backgroundColor: Colors.transparent,
            maxRadius: maxRadius,
          )),
    );
  }
}
