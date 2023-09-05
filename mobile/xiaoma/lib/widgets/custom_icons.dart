import 'package:flutter/cupertino.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:xiaoma/app/themes/themes.dart';

Widget myLocationIconOrder({
  double minRadius = 20,
  int ripplesCount = 3,
  Widget? child,
}) {
  return RippleAnimation(
    color: AppColors.primaryColor,
    delay: const Duration(milliseconds: 300),
    repeat: true,
    minRadius: minRadius,
    ripplesCount: ripplesCount,
    duration: const Duration(milliseconds: 6 * 300),
    child: child ?? const Icon(CupertinoIcons.map_pin_ellipse),
  );
}
