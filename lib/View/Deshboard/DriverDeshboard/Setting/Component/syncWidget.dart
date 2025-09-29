import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sync_Widget extends StatelessWidget {
  Sync_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 25,
        width: 25,
        child: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("OK"),
        ),
      ),
    );
  }
}
