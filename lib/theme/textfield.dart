

import 'package:driver_app_alpha/theme/color.dart';
import 'package:flutter/material.dart';

class MTextFormFieldTheme {
  MTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MColors.darkGrey,
    suffixIconColor: MColors.darkGrey,
    labelStyle: const TextStyle().copyWith( color: MColors.black),
    hintStyle: const TextStyle().copyWith(color: MColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: MColors.black.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 1, color: MColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 1, color: MColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 1, color: MColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 1, color: MColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 2, color: MColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: MColors.darkGrey,
    suffixIconColor: MColors.darkGrey,
    labelStyle: const TextStyle().copyWith( color: MColors.white),
    hintStyle: const TextStyle().copyWith( color: MColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: MColors.white.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
  
      borderSide: const BorderSide(width: 1, color: MColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
  
      borderSide: const BorderSide(width: 1, color: MColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 1, color: MColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 1, color: MColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(

      borderSide: const BorderSide(width: 2, color: MColors.warning),
    ),
  );
}