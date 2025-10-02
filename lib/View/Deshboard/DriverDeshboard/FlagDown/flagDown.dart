import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:driver_app_alpha/Component/customButton.dart';
import 'package:driver_app_alpha/Component/osm.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Component/textfield.dart';
import 'package:driver_app_alpha/Controller/messageController.dart';
import 'package:driver_app_alpha/Controller/osm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlagDownScreen extends StatelessWidget {
  const FlagDownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WayController controller = Get.put(WayController());
    final MapControllerX map_controller = Get.put(MapControllerX());
    String locationText = "Fetching location...";
    const List<String> list = ["One Way", "Two Way"];
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 19, 128),
        title: Text(
          'Flag Down',
          style: gilroyBold(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,

                // color: theme.cardColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      Text(
                        "Passanger Form",
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium!.color,
                          fontSize: 25,
                        ),
                      ),

                      IconButton.filled(
                        color: const Color.fromARGB(255, 14, 148, 19),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: hight / 2.5,
              width: width / 1,
              // color: Colors.amber,
              child: OpenStreetMapScreen(),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: theme.scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 15),

                                // Current Location TextField ---------------------------------------------------
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      map_controller.locationText.value,
                                      style: gilroyBold(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Drop-off TextField---------------------------------------------------------
                        SizedBox(
                          height: 50,
                          width: width,
                          child: CustomTextFieldDy(
                            onChanged: (value) {},
                            showBorder: false,
                            hintText: "Drop off",
                            prefixIcon: Icons.location_on,
                            color: Colors.red,
                          ),
                        ),

                        // Two Way TextField ---------------------------------------------------
                        Obx(
                          () => controller.viaLocation.value
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    width: width,
                                    child: CustomTextFieldDy(
                                      showBorder: false,
                                      hintText: "Two Way...",
                                      prefixIcon: Icons.location_on,
                                      color: Colors.red,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                )
                              : const SizedBox(height: 20),
                        ),

                        // Two Way TextField ---------------------------------------------------
                        Obx(
                          () => controller.viaLocation.value
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: SizedBox(
                                    height: 50,
                                    width: width,
                                    child: CustomTextFieldDy(
                                      showBorder: false,
                                      hintText: "Two Way...",
                                      prefixIcon: Icons.location_on,
                                      color: Colors.red,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                )
                              : const SizedBox(height: 0),
                        ),

                        // Name TextField ---------------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              width: width / 2.5,
                              child: CustomTextFieldDy(
                                keyboard: TextInputType.name,
                                hintText: "Name",
                                showBorder: true,
                                borderColor: Colors.white,
                                borderRadius: 12,
                                onChanged: (value) {},
                              ),
                            ),

                            // Number TextField ---------------------------------------------------
                            SizedBox(
                              height: 40,
                              width: width / 2.5,
                              child: CustomTextFieldDy(
                                keyboard: TextInputType.number,
                                hintText: "Number",
                                showBorder: true,
                                borderColor: Colors.white,
                                borderRadius: 12,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Email TextField ---------------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              width: width / 2.5,
                              child: CustomTextFieldDy(
                                keyboard: TextInputType.emailAddress,
                                hintText: "Email",
                                showBorder: true,
                                borderColor: Colors.white,
                                borderRadius: 12,
                                onChanged: (value) {},
                              ),
                            ),

                            // Luggage TextField ---------------------------------------------------
                            SizedBox(
                              height: 40,
                              width: width / 2.5,
                              child: CustomTextFieldDy(
                                keyboard: TextInputType.number,
                                hintText: "Luggage",
                                showBorder: true,
                                borderColor: Colors.white,
                                borderRadius: 12,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Person TextField ---------------------------------------------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              width: width / 2.5,
                              child: CustomTextFieldDy(
                                keyboard: TextInputType.number,
                                hintText: "Person",
                                showBorder: true,
                                borderColor: Colors.white,
                                borderRadius: 12,
                                onChanged: (value) {},
                              ),
                            ),

                            // Two Way Select Drop Down ---------------------------------------------------
                            Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: width / 2.5,

                              child: CustomDropdown(
                                items: list,
                                hintText: "Select Way",
                                initialItem: list[0],
                                decoration: CustomDropdownDecoration(
                                  expandedFillColor: const Color.fromARGB(
                                    255,
                                    211,
                                    207,
                                    207,
                                  ),
                                  closedFillColor: Colors.grey.shade100,
                                ),
                                onChanged: (value) {
                                  int index = list.indexOf(value!);
                                  controller.viaLocation.value = index == 1;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              text: "Reset",
                              color: Colors.green,

                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              onPressed: () {},
                            ),
                            CustomButton(
                              text: "Quote",
                              color: Colors.green,

                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                            ),
                            CustomButton(
                              text: "GO",
                              color: Colors.green,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 23,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
