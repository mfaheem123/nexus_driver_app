import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/customButton.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Component/textfield.dart';
import 'package:driver_app_alpha/Controller/date_controller.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Statistics/Component/component_statistica.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StaticticsScreen extends StatelessWidget {
  const StaticticsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dateStartController = Get.put(DateStartController());
    final dateEndController = Get.put(DateEndController());
    const List<String> list = ["Cash", "Credit"];
    RxBool typeCash = false.obs;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          // APP BAR PURPLE COLOR---------------------------
          Container(
            // height: height / 1.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 91, 19, 128),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Statistics',
                        style: gilroySemiBold(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.calendar_month_outlined,
                      //     color: Colors.white,
                      //     size: 25.0,
                      //   ),
                      // ),
                    ],
                  ),
                  //  AppBar End-----------------------------
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 5.0,
                      top: 1.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            "Custom Date Range:",
                            style: gilroyMedium(
                              color: DynamicColors.IncidentType,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.refresh,
                            color: DynamicColors.IncidentType,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 30.0,
                        color: DynamicColors.IncidentType,
                      ),
                      const SizedBox(width: 10),

                      Column(
                        children: [
                          // -----------Date text Field -----------------------------
                          SizedBox(
                            width: width / 2.4,
                            height: 38.0,
                            child: Obx(
                              () => TextField(
                                controller: dateStartController
                                    .startDateController
                                    .value,
                                readOnly: true, // direct typing disable
                                decoration: InputDecoration(
                                  label: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      // vertical: 2,
                                    ),
                                    color: Colors.white,
                                    child: const Text(
                                      "Start Date",
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          124,
                                          124,
                                          124,
                                        ),
                                      ),
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                onTap: () {
                                  dateStartController.pickDate(context);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),

                          // -----------Date text Field -----------------------------
                          SizedBox(
                            width: width / 2.4,
                            height: 38.0,
                            child: Obx(
                              () => TextField(
                                controller:
                                    dateEndController.startDateController.value,
                                readOnly: true, // direct typing disable
                                decoration: InputDecoration(
                                  label: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      // vertical: ,
                                    ),
                                    color: Colors.white,
                                    child: const Text(
                                      "End Date",
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          124,
                                          124,
                                          124,
                                        ),
                                      ),
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                onTap: () {
                                  dateEndController.pickDate(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // ------------BUTTON OF CALCULATE---------------------
                      SizedBox(
                        width: width / 3,
                        child: CustomButton(
                          padding: EdgeInsets.all(2),
                          color: Colors.green,
                          onPressed: () {},
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5.0),
                          text: "Calculate",
                          style: gilroyBold(
                            color: DynamicColors.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            // latterSpacing: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0, bottom: 8.0),
                    child: Text(
                      "Select Payment Type",
                      style: gilroyMedium(color: DynamicColors.IncidentType),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.payment,
                        size: 30.0,
                        color: DynamicColors.IncidentType,
                      ),
                      const SizedBox(width: 10.0),
                      SizedBox(
                        width: width / 2.2,
                        child: DropdownButtonFormField<String>(
                          hint: Text(
                            "Select Payment",
                            style: TextStyle(fontSize: 15),
                          ),
                          items: list.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            int index = list.indexOf(value!);
                            typeCash.value = index == 1;
                          },

                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 2),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 52,
                      //   width: width / 2.5,
                      //   alignment: Alignment.center,

                      //   child: CustomDropdown(
                      //     items: list,
                      //     hintText: "Select Payment",

                      //     initialItem: list[0],

                      //     onChanged: (value) {
                      //       int index = list.indexOf(value!);
                      //       // typeCash.value = index == 1;
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Divider(height: 12.0, color: Colors.white),
                  const SizedBox(height: 10.0),
                  // -----------  Today or Yesterday Section----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "Today",
                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 15.0,
                                ),
                              ),
                              Text(
                                "5 | £15.10",

                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yesterday",
                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 15.0,
                                ),
                              ),
                              Text(
                                "5 | £15.10",
                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 15.0),
                  // ----------------LAST WEEEK OR LAST MINTH SECTION----------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text(
                                "Last Week",
                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 15.0,
                                ),
                              ),
                              Text(
                                "0.000",
                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Month",
                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                "0.000",
                                style: gilroyRegular(
                                  color: DynamicColors.IncidentType,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          ListOfCash(),
        ],
      ),
    );
  }
}
