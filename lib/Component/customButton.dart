// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.elevation,
    this.borderRadius,
    this.color,
    this.onPressed,
    this.padding,
    required this.text,
    this.style,
    this.icon,
  });

  double? elevation;
  IconData? icon;
  BorderRadius? borderRadius;
  Color? color;
  VoidCallback? onPressed;
  EdgeInsets? padding;
  String text;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(elevation ?? 3),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(15))),
            backgroundColor:
                WidgetStateProperty.all(color ?? DynamicColors.primaryColor)),
        onPressed: onPressed,
        child: Container(
          padding: padding ?? EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: icon == null
                ? Text(
                    text,
                    style: style ??
                        TextStyle(
                            color: DynamicColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: DynamicColors.whiteColor,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        text,
                        style: style ??
                            TextStyle(
                                color: DynamicColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
