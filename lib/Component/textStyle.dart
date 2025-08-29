// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import 'color.dart';

validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

gilroyBlack(
    {double? latterSpacing,
    double? fontSize,
    color,
    fontWeight,
    fontStyle,
    TextDecoration? decoration}) {
  return TextStyle(
    decoration: decoration ?? TextDecoration.none,
    fontFamily: "Gilroy-Black",
    fontSize: fontSize ?? 17,
    color: color ?? DynamicColors.primaryColor,
    fontWeight: fontWeight ?? FontWeight.w300,
    wordSpacing: latterSpacing ?? 1.2,
  );
}

gilroyBlackItalic(
    {double? latterSpacing,
    double? fontSize,
    color,
    fontWeight,
    fontStyle,
    TextOverflow,
    TextDecoration? decoration}) {
  return TextStyle(
    overflow: TextOverflow,
    decoration: decoration ?? TextDecoration.none,
    fontFamily: "Gilroy-BlackItalic",
    fontSize: fontSize ?? 17,
    color: color ?? DynamicColors.whiteColor,
    fontWeight: fontWeight ?? FontWeight.bold,
    wordSpacing: latterSpacing ?? 2.2,
  );
}

gilroyBold(
    {double? latterSpacing,
    double? fontSize,
    color,
    fontWeight,
    fontStyle,
    TextOverflow? textOverflow,
    TextDecoration? decoration}) {
  return TextStyle(
    overflow: textOverflow ?? TextOverflow.ellipsis,
    decoration: decoration ?? TextDecoration.none,
    fontFamily: "Gilroy-Bold",
    fontSize: fontSize ?? 17,
    color: color ?? DynamicColors.blackColor,
    fontWeight: fontWeight ?? FontWeight.w600,
    wordSpacing: latterSpacing ?? 2.2,
  );
}

gilroySemiBold(
    {double? latterSpacing,
    double? fontSize,
    color,
    fontWeight,
    fontStyle,
      TextOverflow? textOverflow,
    TextDecoration? decoration}) {
  return TextStyle(
    overflow: textOverflow ?? TextOverflow.ellipsis,
    decoration: decoration ?? TextDecoration.none,
    fontFamily: "Gilroy-SemiBold",
    fontSize: fontSize ?? 17,
    color: color ?? DynamicColors.blackColor,
    fontWeight: fontWeight ?? FontWeight.w600,
    wordSpacing: latterSpacing ?? 2.2,
  );
}

gilroyMedium(
    {double? latterSpacing,
    double? fontSize,
    color,
    fontWeight,
    fontStyle,
      TextOverflow? textOverflow,

      TextDecoration? decoration}) {
  return TextStyle(
    overflow: textOverflow ?? TextOverflow.ellipsis,

    decoration: decoration ?? TextDecoration.none,
    fontFamily: "Gilroy-Medium",
    fontSize: fontSize ?? 17,
    color: color ?? DynamicColors.blackColor,
    fontWeight: fontWeight ?? FontWeight.w600,
    wordSpacing: latterSpacing ?? 2.2,
  );
}

gilroyRegular(
    {double? latterSpacing,
    double? fontSize,
    color,
    fontWeight,
    fontStyle,
    TextDecoration? decoration}) {
  return TextStyle(
    decoration: decoration ?? TextDecoration.none,
    fontFamily: "Gilroy-Regular",
    fontSize: fontSize ?? 17,
    color: color ?? DynamicColors.blackColor,
    fontWeight: fontWeight ?? FontWeight.w600,
    wordSpacing: latterSpacing ?? 2.2,
  );
}

gilroyLight(
    {double? latterSpacing,
    double? fontSize,
    color,
    fontWeight,
    fontStyle,
    TextDecoration? decoration}) {
  return TextStyle(
    decoration: decoration ?? TextDecoration.none,
    fontFamily: "Gilroy-Light",
    fontSize: fontSize ?? 17,
    color: color ?? DynamicColors.blackColor,
    fontWeight: fontWeight ?? FontWeight.w600,
    wordSpacing: latterSpacing ?? 2.2,
  );
}
