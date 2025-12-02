import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/DriverDeshboard/DriverDashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Component/full_image.dart';
import '../../DriverDeshboard/DriverDeshboard/controller/controller.dart';

class ViewDocument_Screen extends StatelessWidget {
  ViewDocument_Screen({super.key});

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
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_sharp, color: Colors.white,))),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "View Document",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Profile Info Card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _ProfileInfoItem(
                          title: "Log Book",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .logBook!
                              .logBookDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "Mot",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .mot!
                              .motDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "MOt2",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .mot2!
                              .mot2Document
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "Insurance",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .insurance!
                              .insuranceDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "Joining Date",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .phcVehicle!
                              .phcVehicleDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "Road Tax",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .roadTax!
                              .roadTaxDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "Rental Agreement",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .rentalAgreement!
                              .rentalAgreementDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "V5 Registration",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .v5Registration!
                              .v5RegistrationDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "Licence",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .licence!
                              .licenceDocument
                              .toString(),
                        ),
                        _ProfileInfoItem(
                          title: "PHC Driver",
                          imageUrl: controller
                              .driverDetailsModel!
                              .driver!
                              .vehicle!
                              .phcDriver!
                              .phcDriverDocument
                              .toString(),
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
          ),
        );
      },
    );
  }
}

class _ProfileInfoItem extends StatelessWidget {
  final String title;
  final String? imageUrl;

  const _ProfileInfoItem({
    required this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    bool showImage = imageUrl != null && imageUrl!.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "$title\n",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          showImage
              ? Center(
                child: GestureDetector(
                            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImage(imageUrl: imageUrl!),
                  ),
                );
                            },
                            child: Container(
                height: 180,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl!),
                  ),
                ),
                            ),
                          ),
              )
              : Container(

                          height: 180,
                          width: 500,
                          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade800,
                          ),
                          child: const Center(
              child: Text(
                "No Image Available",
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              ),
                          ),
                        ),
        ],
      ),
    );
  }
}

