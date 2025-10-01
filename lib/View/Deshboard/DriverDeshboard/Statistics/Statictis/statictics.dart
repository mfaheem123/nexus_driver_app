import 'package:driver_app_alpha/Component/color.dart';
import 'package:driver_app_alpha/Component/customButton.dart';
import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Component/textfield.dart';
import 'package:driver_app_alpha/View/Deshboard/DriverDeshboard/Statistics/Component/component_statistica.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StaticticsScreen extends StatelessWidget {
  const StaticticsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          // APP BAR PURPLE COLOR---------------------------
          Container(
            height: height / 1.8,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 91, 19, 128),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                    //  AppBar End-----------------------------
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 5.0,
                        top: 15.0,
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
                          size: 35.0,
                          color: DynamicColors.IncidentType,
                        ),
                        const SizedBox(width: 10),

                        Column(
                          children: [
                            // -----------Date text Field -----------------------------
                            SizedBox(
                              width: width / 2.4,
                              height: 38.0,
                              child: CustomTextFieldDy(
                                hintText: "Select Start Date",
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(height: 8.0),

                            // -----------Date text Field -----------------------------
                            SizedBox(
                              width: width / 2.4,
                              height: 38.0,
                              child: CustomTextFieldDy(
                                hintText: "Select End Date",
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // ------------BUTTON OF CALCULATE---------------------
                        SizedBox(
                          width: width / 3,
                          child: CustomButton(
                            padding: EdgeInsets.all(2.0),
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
                      padding: const EdgeInsets.only(left: 45.0, bottom: 12.0),
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
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: 39.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "All Type",
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),

                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
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
          ),

          ListOfCash(),
        ],
      ),
    );
  }
}
