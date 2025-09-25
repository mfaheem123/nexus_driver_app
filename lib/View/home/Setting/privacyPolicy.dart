
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Privacy & Policy", style: gilroyRegular(
            fontSize: 25.0, 
          ),)
        ],
      ),
    );
  }
}