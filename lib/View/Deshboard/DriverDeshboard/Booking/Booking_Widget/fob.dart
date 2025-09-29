import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FobSreen extends StatelessWidget {
  const FobSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: DynamicColors.whiteColor,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        title: Text(
          'FOB',
          style: gilroySemiBold(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Work is in the Process")),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
