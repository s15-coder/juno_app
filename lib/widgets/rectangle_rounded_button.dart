import 'package:flutter/material.dart';
import 'package:juno_app/config/config.dart';
import 'package:juno_app/theme/custom_color_scheme.dart';

class RectangleRoundedButton extends StatelessWidget {
  const RectangleRoundedButton({
    Key? key,
    this.filled = false,
    this.label,
    this.padding,
    this.fontSize,
    this.onTap,
  }) : super(key: key);
  final bool filled;
  final String? label;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: filled ? blueJuno : Theme.of(context).canvasColor,
          border: Border.all(
            color: filled
                ? Colors.white
                : filled
                    ? blueJuno
                    : Theme.of(context).colorScheme.blueOrWhite,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        margin: const EdgeInsets.only(bottom: 9),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
        child: Text(
          label ?? '',
          style: TextStyle(
            color: filled
                ? Colors.white
                : Theme.of(context).colorScheme.blueOrWhite,
            fontSize: fontSize ?? 12,
          ),
        ),
      ),
    );
  }
}
