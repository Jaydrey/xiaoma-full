import 'package:flutter/material.dart';

class MiniWidgets{
  static Widget circularProgressIndicatorOnButton() {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 4,
      ),
    );
  }
}