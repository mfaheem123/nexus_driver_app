import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/View/Deshboard/BottomScreens/Job/JobInvitationScreen.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Booking/FareMeter/fareMeterScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentScreen extends StatelessWidget {
  const PresentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       size: 25,
      //       color: DynamicColors.whiteColor,
      //     ),
      //   ),
      //   backgroundColor: const Color.fromARGB(255, 91, 19, 128),
      //   title: Text(
      //     'Present',
      //     style: gilroySemiBold(
      //       color: Colors.white,
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: 
      JobInvitationScreen()
      
      
      //  Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Center(child: Text("Work is in the Process")),
      //     CircularProgressIndicator(),
      //   ],
      // ),
    );
  }
}
