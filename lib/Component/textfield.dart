import 'package:flutter/material.dart';

class CustomTextFieldDy extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final VoidCallback? onPressed;

  const CustomTextFieldDy({
    super.key,
    this.onPressed,
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.black)
            : null,
        suffix: sufixIcon != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(sufixIcon, color: Colors.black, size: 30),
              )
            : null,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 2.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
