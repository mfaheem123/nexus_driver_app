import 'package:driver_app/Component/textStyle.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class CustomStyle {
  static TextStyle forcastTextStyle = gilroyMedium(
    color: DynamicColors.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle forcastW300Font22 = gilroyMedium(
      fontSize: 22,
      fontWeight: FontWeight.w300,
      color: DynamicColors.whiteColor);

  static TextStyle forcastW400Font15 = gilroyMedium(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: DynamicColors.dividerColor);
}

class BoxShadows {
  static List<BoxShadow> get forcastBoxShadow {
    return [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(5, 4),
        blurRadius: 10,
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.25),
        offset: Offset(1, 1),
        blurRadius: 0,
        spreadRadius: 0,
      ),
    ];
  }
}
