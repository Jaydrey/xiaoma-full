import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? elevation;
  const CustomElevatedButton({
    super.key,
    this.style,
    this.onPressed,
    this.child,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              elevation: elevation,
            ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
