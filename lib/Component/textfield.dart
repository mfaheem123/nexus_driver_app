import 'package:flutter/material.dart';

class CustomTextFieldDy extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? Textcolor;
  final bool showBorder;
  double borderRadius;
  final Color? borderColor;

  CustomTextFieldDy({
    super.key,
    this.onPressed,
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.obscureText = false,
    this.controller,
    this.color,
    this.borderRadius = 15,
    this.borderColor,
    this.Textcolor,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Textcolor ?? Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: color, size: 25)
            : null,
        suffix: sufixIcon != null
            ? IconButton(
         
                onPressed: onPressed,
                icon: Icon(sufixIcon, color: color, size: 30),
              )
            : null,
        filled: true,
        fillColor: Colors.grey.shade100,

        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8, //
          horizontal: 10,
        ),

        enabledBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.black,
               
                ),
              )
            : InputBorder.none,

        focusedBorder: showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.black,
                  width: 1,
                ),
              )
            : InputBorder.none,
      ),
    );
  }
  }