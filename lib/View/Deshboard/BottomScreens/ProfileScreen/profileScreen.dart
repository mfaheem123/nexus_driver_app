import 'package:driver_app_alpha/View/Deshboard/BottomScreens/ProfileScreen/view_document.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/DriverDeshboard/DriverDashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../DriverDeshboard/DriverDeshboard/controller/controller.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  Deshboard controller = Get.isRegistered<Deshboard>()
      ? Get.find<Deshboard>()
      : Get.put(Deshboard());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Deshboard>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFF5A287D),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Profile Picture with Camera Icon
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:  NetworkImage(controller.driverDetailsModel!.driver!.image.toString() ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    // const Positioned(
                    //   bottom: 4,
                    //   right: 4,
                    //   child: CircleAvatar(
                    //     radius: 15,
                    //     backgroundColor: Colors.white,
                    //     child: Icon(
                    //       Icons.camera_alt,
                    //       size: 16,
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  controller.driverDetailsModel!.driver!.username??"Guest",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.greenAccent),
                    SizedBox(width: 5),
                    Text(controller.driverDetailsModel!.driver!.address??"No address", style: TextStyle(color: Colors.white70)),
                  ],
                ),
                const SizedBox(height: 15),

                // Profile Info Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(80),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProfileInfoItem(
                        title: "Full Name",
                        value: controller.driverDetailsModel!.driver!.username??"Guest" ,
                      ),
                      _ProfileInfoItem(
                        title: "Email",
                        value: controller.driverDetailsModel!.driver!.email??"Guest@gmail.com" ,
                      ),
                       _ProfileInfoItem(
                        title: "Address",
                        value: controller.driverDetailsModel!.driver!.address??"No address" ,
                      ),
                       _ProfileInfoItem(
                        title: "Phone Number",
                        value: controller.driverDetailsModel!.driver!.mobile ??"Guest" ,
                        flagEmoji: "🇬🇧",
                      ),
                      _ProfileInfoItem(
                        title: "Joining Date",
                        value: controller.driverDetailsModel!.driver!.startDate ??"Guest",
                      ),
                       _ProfileInfoItem(
                        title: "Allotted vehicle",
                        value: controller.driverDetailsModel!.driver!.vehicle!.vehicleType!.name ??"No vehicle",
                      ),
                       _ProfileInfoItem(
                        title: "Current vehicle",
                        value: controller.driverDetailsModel!.driver!.vehicle!.vehicleType!.name ??"No vehicle",
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Get.to(ViewDocument_Screen());
                        },
                        child: Text(
                          "View Document",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Go Back Button
                // SizedBox(
                //   width: 180,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Get.to(DriverDashboard());
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.green,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       padding: const EdgeInsets.symmetric(vertical: 15),
                //     ),
                //     child: const Text(
                //       "Go Back",
                //       style: TextStyle(color: Colors.white, fontSize: 16),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 30),
              ],
            ),
          ),
        );
      }
    );
  }
}

class _ProfileInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final String? flagEmoji;

  const _ProfileInfoItem({
    required this.title,
    required this.value,
    this.flagEmoji,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title\n",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: flagEmoji != null ? "$flagEmoji $value" : value,
              style: const TextStyle(
                color: Colors.white70,

                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
